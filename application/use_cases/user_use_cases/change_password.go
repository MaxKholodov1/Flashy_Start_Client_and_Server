package user_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/validation"
	"golang.org/x/crypto/bcrypt"
	"log/slog"
)

func (u *UserUseCases) ChangePassword(ctx context.Context, password, newpassword string) (bool, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	user, err := u.GetUserByID(ctx, userID)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}
	if err := bcrypt.CompareHashAndPassword([]byte(user.PasswordHash), []byte(password)); err != nil {
		slog.Error("Failed comparing password", "err", err)
		return false, use_cases.ErrIncorrectPassword
	}
	if err := validation.ValidatePassword(newpassword); err != nil {
		return false, err
	}
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(newpassword), bcrypt.DefaultCost)
	if err != nil {
		slog.Error("Failed hashing password", "err", err)
		return false, use_cases.ErrFailedToGeneratePasswordHash
	}
	err = u.userRepository.UpdatePasswordAndIncrementTokenVersion(ctx, userID, string(hashedPassword))
	if err != nil {
		slog.Error("Failed updating password", "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	return true, nil
}
