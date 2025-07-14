package user_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/validation"
	"golang.org/x/crypto/bcrypt"
	"log/slog"
)

func (u *UserUseCases) ChangePassword(ctx context.Context, password, newpassword string) (bool, string, string, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return false, "err", "err", use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		return false, "err", "err", use_cases.ErrAccessTokenInvalid
	}
	user, err := u.GetUserByID(ctx, userID)
	if err != nil {
		return false, "err", "err", use_cases.ErrDBFailure(err)
	}
	if err := bcrypt.CompareHashAndPassword([]byte(user.PasswordHash), []byte(password)); err != nil {
		slog.Error("Failed comparing password", "err", err)
		return false, "err", "err", use_cases.ErrIncorrectPassword
	}
	if err := validation.ValidatePassword(newpassword); err != nil {
		return false, "err", "err", err
	}
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(newpassword), bcrypt.DefaultCost)
	if err != nil {
		slog.Error("Failed hashing password", "err", err)
		return false, "err", "err", use_cases.ErrFailedToGeneratePasswordHash
	}
	err = u.userRepository.UpdatePasswordAndIncrementTokenVersion(ctx, userID, string(hashedPassword))
	if err != nil {
		slog.Error("Failed updating password", "err", err)
		return false, "err", "err", use_cases.ErrDBFailure(err)
	}
	refreshToken, err := u.tokenService.GenerateRefreshToken(userID, ctx)
	if err != nil {
		slog.Error("Failed generating refresh token", "err", err)
		return false, "err", "err", use_cases.ErrDBFailure(err)
	}
	accessToken, err = u.tokenService.GenerateAccessToken(userID, ctx)
	if err != nil {
		slog.Error("Failed generating access token", "err", err)
		return false, "err", "err", use_cases.ErrDBFailure(err)
	}
	slog.Info("Successfully changed password", "refreshToken", refreshToken, "accessToken", accessToken)
	return true, refreshToken, accessToken, nil
}
