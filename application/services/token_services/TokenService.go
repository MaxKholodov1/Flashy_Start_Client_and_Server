package token_services

import (
	"context"
	"github.com/golang-jwt/jwt/v5"
	"go_server/application/use_cases"
	"go_server/domain/repositories"
	"google.golang.org/grpc/metadata"
	"log/slog"
	"time"
)

type TokenService struct {
	secretKey       string
	refreshKey      string
	accessTokenTTL  time.Duration
	refreshTokenTTL time.Duration
	userRepository  repositories.UserRepository
}

func NewTokenService(secretKey, refreshKey string, accessTTL, refreshTTL time.Duration, userRepository repositories.UserRepository) *TokenService {
	return &TokenService{
		secretKey:       secretKey,
		refreshKey:      refreshKey,
		accessTokenTTL:  accessTTL,
		refreshTokenTTL: refreshTTL,
		userRepository:  userRepository,
	}
}

func (t *TokenService) GenerateAccessToken(userID int, ctx context.Context) (string, error) {
	tokenVersion, err := t.userRepository.GetTokenVersion(ctx, userID)
	if err != nil {
		slog.Error("failed to get token version", "err", err)
		return "", use_cases.ErrDBFailure(err)
	}
	claims := jwt.MapClaims{
		"user_id":       userID,
		"token_version": tokenVersion,
		"exp":           time.Now().Add(t.accessTokenTTL).Unix(),
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(t.secretKey))
}

func (t *TokenService) GenerateRefreshToken(userID int, ctx context.Context) (string, error) {
	tokenVersion, err := t.userRepository.GetTokenVersion(ctx, userID)
	if err != nil {
		slog.Error("failed to get token version", "err", err)
		return "", use_cases.ErrDBFailure(err)
	}
	claims := jwt.MapClaims{
		"user_id":       userID,
		"token_version": tokenVersion,
		"exp":           time.Now().Add(t.refreshTokenTTL).Unix(),
		"typ":           "refresh",
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(t.refreshKey))
}

func (t *TokenService) ParseAccessToken(tokenStr string, ctx context.Context) (int, error) {
	token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, use_cases.ErrAccessTokenInvalidSignature
		}
		return []byte(t.secretKey), nil
	})
	if err != nil || !token.Valid {
		return 0, use_cases.ErrAccessTokenInvalid
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		return 0, use_cases.ErrAccessTokenInvalidClaims
	}

	userIDf, ok := claims["user_id"].(float64)
	if !ok {
		return 0, use_cases.ErrAccessTokenMissingUserID
	}
	userID := int(userIDf)

	// Проверяем expiration
	if expf, ok := claims["exp"].(float64); ok {
		if int64(expf) < time.Now().Unix() {
			return 0, use_cases.ErrAccessTokenExpired
		}
	}

	// Проверяем token_version
	tokenVersionFromToken, ok := claims["token_version"].(float64)
	if !ok {
		return 0, use_cases.ErrAccessTokenInvalidClaims
	}

	// Получаем актуальный token_version из БД
	userTokenVersion, err := t.userRepository.GetTokenVersion(ctx, userID)
	if err != nil {
		return 0, err
	}
	if userTokenVersion != int(tokenVersionFromToken) {
		return 0, use_cases.ErrAccessTokenInvalid // или отдельная ошибка типа ErrAccessTokenVersionMismatch
	}

	return userID, nil
}

func (t *TokenService) ParseRefreshToken(tokenStr string, ctx context.Context) (int, error) {
	token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, use_cases.ErrRefreshTokenInvalidSignature
		}
		return []byte(t.refreshKey), nil
	})
	if err != nil || !token.Valid {
		return 0, use_cases.ErrRefreshTokenInvalid
	}

	claims, ok := token.Claims.(jwt.MapClaims)
	if !ok {
		return 0, use_cases.ErrRefreshTokenInvalidClaims
	}

	userIDf, ok := claims["user_id"].(float64)
	if !ok {
		return 0, use_cases.ErrRefreshTokenMissingUserID
	}
	userID := int(userIDf)

	if expf, ok := claims["exp"].(float64); ok {
		if int64(expf) < time.Now().Unix() {
			return 0, use_cases.ErrRefreshTokenExpired
		}
	}

	tokenVersionFromToken, ok := claims["token_version"].(float64)
	if !ok {
		return 0, use_cases.ErrRefreshTokenInvalidClaims
	}

	userTokenVersion, err := t.userRepository.GetTokenVersion(ctx, userID)
	if err != nil {
		return 0, err
	}
	if userTokenVersion != int(tokenVersionFromToken) {
		return 0, use_cases.ErrRefreshTokenInvalid // или отдельная ошибка
	}

	return userID, nil
}
func (t *TokenService) GetTokenFromMetadata(ctx context.Context) (string, error) {
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return "", use_cases.ErrMetadataNotProvided
	}

	tokens := md.Get("authorization")
	if len(tokens) == 0 {
		return "", use_cases.ErrAuthorizationTokenMissing
	}

	const bearerPrefix = "Bearer "
	rawToken := tokens[0]
	if len(rawToken) < len(bearerPrefix) || rawToken[:len(bearerPrefix)] != bearerPrefix {
		return "", use_cases.ErrAuthorizationTokenInvalidFormat
	}

	accessToken := rawToken[len(bearerPrefix):]
	return accessToken, nil
}
