package user_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"log/slog"
	"time"
)

func (u *UserUseCases) VerifyEmail(ctx context.Context, code string, userID int) (bool, error) {
	ev, err := u.emailVerificationRepository.GetByUserID(ctx, userID)
	if err != nil {
		slog.Error("Failed to get email verification record", "userID", userID, "err", err)
		return false, use_cases.ErrDBFailure(err) // ошибка, например, запись не найдена
	}

	// Проверяем, что код совпадает и не истёк
	if ev.Code == code && ev.ExpiresAt.After(time.Now()) {
		// Помечаем email как подтверждённый
		err = u.userRepository.MarkEmailVerified(ctx, userID)
		if err != nil {
			slog.Error("Failed to mark email verified for user", "userID", userID, "err", err)
			return false, err
		}

		// Можно удалить запись о верификации, чтобы не использовать повторно
		_ = u.emailVerificationRepository.DeleteByUserID(ctx, userID)

		return true, nil
	}

	return false, nil // код не совпадает или истёк
}
