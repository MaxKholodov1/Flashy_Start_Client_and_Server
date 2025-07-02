package token_services

import (
	"context"
	"github.com/golang-jwt/jwt/v5"
	"go_server/application/use_cases"
	"google.golang.org/grpc/metadata"
	"time"
)

type TokenService struct {
	secretKey       string
	refreshKey      string
	accessTokenTTL  time.Duration
	refreshTokenTTL time.Duration
}

func NewTokenService(secretKey, refreshKey string, accessTTL, refreshTTL time.Duration) *TokenService {
	return &TokenService{
		secretKey:       secretKey,
		refreshKey:      refreshKey,
		accessTokenTTL:  accessTTL,
		refreshTokenTTL: refreshTTL,
	}
}

func (t *TokenService) GenerateAccessToken(userID int) (string, error) {
	claims := jwt.MapClaims{
		"user_id": userID,
		"exp":     time.Now().Add(t.accessTokenTTL).Unix(),
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(t.secretKey))
}

func (t *TokenService) GenerateRefreshToken(userID int) (string, error) {
	claims := jwt.MapClaims{
		"user_id": userID,
		"exp":     time.Now().Add(t.refreshTokenTTL).Unix(),
		"typ":     "refresh",
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(t.refreshKey))
}
func (t *TokenService) ParseAccessToken(tokenStr string) (int, error) {
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

	userID, ok := claims["user_id"].(float64)
	if !ok {
		return 0, use_cases.ErrAccessTokenMissingUserID
	}

	if exp, ok := claims["exp"].(float64); ok {
		if int64(exp) < time.Now().Unix() {
			return 0, use_cases.ErrAccessTokenExpired
		}
	}

	return int(userID), nil
}

func (t *TokenService) ParseRefreshToken(tokenStr string) (int, error) {
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

	userID, ok := claims["user_id"].(float64)
	if !ok {
		return 0, use_cases.ErrRefreshTokenMissingUserID
	}

	if exp, ok := claims["exp"].(float64); ok {
		if int64(exp) < time.Now().Unix() {
			return 0, use_cases.ErrRefreshTokenExpired
		}
	}

	return int(userID), nil
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
