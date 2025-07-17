package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/domain/entities"
)

type EmailVerificationRepository interface {
	// Создать или обновить код подтверждения для пользователя
	Upsert(ctx context.Context, ev *entities.EmailVerification) error

	// Получить запись подтверждения по user_id
	GetByUserID(ctx context.Context, userID int) (*entities.EmailVerification, error)

	// Удалить запись подтверждения после успешной верификации
	DeleteByUserID(ctx context.Context, userID int) error
	DeleteByUserIDTX(ctx context.Context, tx pgx.Tx, userID int) error
}
