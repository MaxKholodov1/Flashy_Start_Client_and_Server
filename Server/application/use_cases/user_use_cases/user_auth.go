package user_use_cases

import (
	"context"
	"errors"
	"fmt"
	"github.com/jackc/pgx/v5"
	use_cases2 "go_server/Server/application/use_cases"
	entities2 "go_server/Server/domain/entities"
	"golang.org/x/crypto/bcrypt"
	"log/slog"
	"strings"
	"time"
)

func (u *UserUseCases) Login(ctx context.Context, identifier, password string) (*entities2.User, bool, bool, error) {
	var user *entities2.User
	var err error

	if strings.Contains(identifier, "@") {
		user, err = u.userRepository.GetByEmail(identifier)
	} else {
		user, err = u.userRepository.GetByUserName(identifier)
	}

	if errors.Is(err, pgx.ErrNoRows) {
		return nil, false, false, use_cases2.ErrUserNotFound
	} else if err != nil {
		slog.Error("Failed getting user", "identifier", identifier, "err", err)
		return nil, false, false, fmt.Errorf("failed to get user: %w", err)
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.PasswordHash), []byte(password)); err != nil {
		slog.Error("Failed comparing password", "identifier", identifier, "err", err)
		return nil, false, false, use_cases2.ErrIncorrectPassword
	}
	isVerified, err := u.userRepository.IsEmailVerified(ctx, int(user.ID))
	if err != nil {
		slog.Error("Failed checking if email verified", "identifier", identifier, "err", err)
		return nil, false, false, use_cases2.ErrDBFailure(err)
	}
	if isVerified == false {
		// Генерация кода подтверждения (6 цифр)
		code := use_cases2.GenerateVerificationCode()
		// Сохраняем код
		verification := &entities2.EmailVerification{
			UserID:    int(user.ID),
			Code:      code,
			ExpiresAt: time.Now().UTC().Add(15 * time.Minute),
		}
		if err := u.emailVerificationRepository.Upsert(ctx, verification); err != nil {
			slog.Error("Failed to save email verification", "err", err)
		}
		// Отправка email
		if err := u.emailSender.SendVerificationCode(user.Email, code); err != nil {
			slog.Error("Failed to send verification email", "err", err)
		}
		return user, true, false, nil
	}
	return user, true, true, nil
}
