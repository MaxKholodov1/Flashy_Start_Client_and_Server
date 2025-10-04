package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/Server/domain/entities"
)

type UserRepository interface {
	Create(user *entities.User) (int, error)
	GetByID(id int) (*entities.User, error)
	GetByUserName(userName string) (*entities.User, error)
	GetByEmail(email string) (*entities.User, error)
	Update(user *entities.User) error
	MarkEmailVerified(ctx context.Context, userID int) error
	IsEmailVerified(ctx context.Context, userID int) (bool, error)
	UpdatePasswordAndIncrementTokenVersion(ctx context.Context, userID int, newPasswordHash string) error
	GetTokenVersion(ctx context.Context, userID int) (int, error)
	BeginTx(ctx context.Context) (pgx.Tx, error)
	UpdatePasswordAndIncrementTokenVersionTx(ctx context.Context, tx pgx.Tx, userID int, newPasswordHash string) error
	DeleteUserTx(ctx context.Context, tx pgx.Tx, userID int) error
}
