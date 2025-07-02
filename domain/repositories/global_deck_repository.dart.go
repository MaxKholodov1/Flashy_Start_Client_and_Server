package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/domain/entities"
)

type GlobalDeckRepository interface {
	Create(title, description string, isPublic bool, authorID, version int) (int, error)
	CreateTx(ctx context.Context, tx pgx.Tx, title, description string, isPublic bool, authorID, version int) (int, error)
	GetByID(id int) (*entities.GlobalDeck, error)
	Update(id int, title, description *string, tags []string, version int) error
	Delete(id int) error
	ListByUser(userID int) ([]*entities.GlobalDeck, error)
	SearchByTitleOffset(query string, limit, offset int) ([]*entities.GlobalDeck, bool, error)
}
