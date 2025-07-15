package user_use_cases

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"go_server/domain/services"
	"golang.org/x/crypto/bcrypt"
	"log/slog"
	"strings"
)

func (u *UserUseCases) PasswordRecovery(ctx context.Context, usernameOrEmail string) (bool, error) {
	var err error
	var user *entities.User
	if strings.Contains(usernameOrEmail, "@") {
		user, err = u.userRepository.GetByEmail(usernameOrEmail)
	} else {
		user, err = u.userRepository.GetByUserName(usernameOrEmail)
	}
	if err == pgx.ErrNoRows {
		return false, use_cases.ErrUserNotFound
	}
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}
	isVerified, err := u.userRepository.IsEmailVerified(ctx, int(user.ID))

	if !isVerified {
		slog.Error("trying to send email to not verified email")
		return false, use_cases.ErrTryingToSendEmailToNotVerified
	}
	newPassword, err := services.GenerateValidPassword()
	if err != nil {
		slog.Error("trying to generate valid password", "error", err)
		return false, use_cases.ErrFailedToGenerateValidPassword
	}
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(newPassword), bcrypt.DefaultCost)
	if err != nil {
		slog.Error("Failed hashing password", "err", err)
		return false, use_cases.ErrFailedToGeneratePasswordHash
	}
	tx, err := u.userRepository.BeginTx(ctx)
	if err != nil {
		slog.Error("Failed to begin transaction", "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	committed := false
	defer func() {
		if !committed {
			_ = tx.Rollback(ctx)
		}
	}()

	// Обновляем пароль
	err = u.userRepository.UpdatePasswordAndIncrementTokenVersionTx(ctx, tx, int(user.ID), string(hashedPassword))
	if err != nil {
		slog.Error("Failed updating password", "err", err)
		return false, use_cases.ErrDBFailure(err)
	}

	// Отправляем email
	err = u.emailSender.SendNewPassword(user.Email, newPassword)
	if err != nil {
		slog.Error("Failed to send new password email", "err", err)
		return false, use_cases.ErrVerificationError
	}

	// Commit
	if err = tx.Commit(ctx); err != nil {
		slog.Error("Failed to commit transaction", "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	committed = true

	return true, nil
}
