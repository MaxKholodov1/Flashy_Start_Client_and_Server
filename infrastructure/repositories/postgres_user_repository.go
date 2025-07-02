package repositories

import (
	"context"
	"go_server/domain/entities"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
)

type PostgresUserRepository struct {
	db *pgxpool.Pool
}

func NewPostgresUserRepository(db *pgxpool.Pool) *PostgresUserRepository {
	return &PostgresUserRepository{db: db}
}

func (r *PostgresUserRepository) Create(user *entities.User) (int, error) {
	query := `
		INSERT INTO users (userName, email, password_hash, created_at)
		VALUES ($1, $2, $3, $4)
		RETURNING id`
	var id int
	now := time.Now().UTC()
	err := r.db.QueryRow(context.Background(), query,
		user.UserName,
		user.Email,
		user.PasswordHash,
		now,
	).Scan(&id)
	if err != nil {
		print(err.Error())
		return 0, err
	}
	return id, nil
}

func (r *PostgresUserRepository) GetByID(id int) (*entities.User, error) {
	query := `
		SELECT id, userName, email, password_hash, created_at
		FROM users
		WHERE id = $1`
	row := r.db.QueryRow(context.Background(), query, id)

	var user entities.User
	err := row.Scan(
		&user.ID,
		&user.UserName,
		&user.Email,
		&user.PasswordHash,
		&user.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	return &user, nil
}

func (r *PostgresUserRepository) GetByUserName(userName string) (*entities.User, error) {
	query := `
		SELECT id, userName, email, password_hash, created_at
		FROM users
		WHERE userName = $1`
	row := r.db.QueryRow(context.Background(), query, userName)

	var user entities.User
	err := row.Scan(
		&user.ID,
		&user.UserName,
		&user.Email,
		&user.PasswordHash,
		&user.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	return &user, nil
}

func (r *PostgresUserRepository) GetByEmail(email string) (*entities.User, error) {
	query := `
		SELECT id, userName, email, password_hash, created_at
		FROM users
		WHERE email = $1`
	row := r.db.QueryRow(context.Background(), query, email)

	var user entities.User
	err := row.Scan(
		&user.ID,
		&user.UserName,
		&user.Email,
		&user.PasswordHash,
		&user.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	return &user, nil
}

func (r *PostgresUserRepository) Update(user *entities.User) error {
	query := `
		UPDATE users
		SET userName = $1, email = $2
		WHERE id = $3`
	_, err := r.db.Exec(context.Background(), query,
		user.UserName,
		user.Email,
		user.ID,
	)
	return err
}
