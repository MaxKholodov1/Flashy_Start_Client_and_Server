package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/domain/entities"
)

type DeckPermissionRepository interface {
	Create(ctx context.Context, perm *entities.DeckPermission) error
	CreateTx(ctx context.Context, tx pgx.Tx, perm *entities.DeckPermission) error
	GetDeckPermissionsByUserID(ctx context.Context, userID int) ([]*entities.DeckPermission, error)
	GetDeckPermissionsByDeckID(ctx context.Context, deckID int) ([]*entities.DeckPermission, error)
	GetDeckPermissionByUserIDAndDeckID(ctx context.Context, userID int, deckID int) (*entities.DeckPermission, error)
	UpdateRoleByUserIDAndDeckID(ctx context.Context, userID int, deckID int, newRole string) error
	DeleteDeckPermissionByUserIDAndDeckIDTx(ctx context.Context, tx pgx.Tx, userID, deckID int) error
	DeleteAllPermissionsForUserTx(ctx context.Context, tx pgx.Tx, userID int) error
}
