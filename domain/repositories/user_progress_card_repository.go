package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/infrastructure/models"
)

type UserProgressCardRepository interface {
	Create(ctx context.Context, record *models.UserProgressCardRecord) (int, error)
	GetByUserID(ctx context.Context, userID int) ([]*models.UserProgressCardRecord, error)
	GetByUserIDAndCardID(ctx context.Context, userID int, deckID int) (*models.UserProgressCardRecord, error)
	Update(ctx context.Context, record *models.UserProgressCardRecord) error
	GetByUserIDAndDeckID(ctx context.Context, userID int, deckID int) ([]*models.UserProgressCardRecord, error)
	DeleteByDeckTx(ctx context.Context, tx pgx.Tx, userID, deckID int) error
}
