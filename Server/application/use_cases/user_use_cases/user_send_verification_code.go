package user_use_cases

import (
	"context"
	use_cases2 "go_server/Server/application/use_cases"
	"go_server/Server/domain/entities"
	"log/slog"
	"time"
)

func (u *UserUseCases) SendVerificationCode(ctx context.Context, userID int) (bool, error) {
	user, err := u.userRepository.GetByID(userID)
	if err != nil {
		return false, use_cases2.ErrDBFailure(err)
	}
	// Генерация кода подтверждения (6 цифр)
	code := use_cases2.GenerateVerificationCode()

	// Сохраняем код
	verification := &entities.EmailVerification{
		UserID:    userID,
		Code:      code,
		ExpiresAt: time.Now().UTC().Add(15 * time.Minute),
	}
	if err := u.emailVerificationRepository.Upsert(ctx, verification); err != nil {
		slog.Error("Failed to save email verification", "err", err)
		return false, use_cases2.ErrVerificationError
	}
	// Отправка email
	if err := u.emailSender.SendVerificationCode(user.Email, code); err != nil {
		slog.Error("Failed to send verification email", "err", err)
		return false, use_cases2.ErrVerificationError
	}
	return true, nil
}
