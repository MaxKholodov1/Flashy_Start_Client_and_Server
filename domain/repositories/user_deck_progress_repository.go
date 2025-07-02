package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/infrastructure/models"
)

type UserDeckProgressRepository interface {
	Create(ctx context.Context, record *models.UserDeckProgressRecord) (int, error)
	GetByDeckID(ctx context.Context, deckID int) ([]*models.UserDeckProgressRecord, error)
	GetByUserID(ctx context.Context, userID int) ([]*models.UserDeckProgressRecord, error)
	GetByUserIDAndDeckID(ctx context.Context, userID int, deckID int) (*models.UserDeckProgressRecord, error)
	Update(ctx context.Context, record *models.UserDeckProgressRecord) error
	Delete(ctx context.Context, userID int, deckID int) error
	DeleteTx(ctx context.Context, tx pgx.Tx, userID, deckID int) error
}
