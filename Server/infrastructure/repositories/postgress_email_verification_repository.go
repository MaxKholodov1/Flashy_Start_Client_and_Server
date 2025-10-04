package repositories

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/Server/domain/entities"
)

type PostgresEmailVerificationRepository struct {
	db *pgxpool.Pool
}

func NewPostgresEmailVerificationRepository(db *pgxpool.Pool) *PostgresEmailVerificationRepository {
	return &PostgresEmailVerificationRepository{db: db}
}

func (r *PostgresEmailVerificationRepository) Upsert(ctx context.Context, ev *entities.EmailVerification) error {
	query := `
	INSERT INTO email_verifications (user_id, code, expires_at)
	VALUES ($1, $2, $3)
	ON CONFLICT (user_id) DO UPDATE SET code = EXCLUDED.code, expires_at = EXCLUDED.expires_at;
	`
	_, err := r.db.Exec(ctx, query, ev.UserID, ev.Code, ev.ExpiresAt)
	return err
}

func (r *PostgresEmailVerificationRepository) GetByUserID(ctx context.Context, userID int) (*entities.EmailVerification, error) {
	query := `
	SELECT user_id, code, expires_at FROM email_verifications WHERE user_id = $1;
	`
	row := r.db.QueryRow(ctx, query, userID)
	ev := &entities.EmailVerification{}
	err := row.Scan(&ev.UserID, &ev.Code, &ev.ExpiresAt)
	if err != nil {
		return nil, err
	}
	return ev, nil
}

func (r *PostgresEmailVerificationRepository) DeleteByUserID(ctx context.Context, userID int) error {
	commandTag, err := r.db.Exec(ctx, "DELETE FROM email_verifications WHERE user_id = $1;", userID)
	if err != nil {
		return err
	}
	if commandTag.RowsAffected() == 0 {
		return errors.New("no email verification record found to delete")
	}
	return nil
}

func (r *PostgresEmailVerificationRepository) DeleteByUserIDTX(ctx context.Context, tx pgx.Tx, userID int) error {
	commandTag, err := tx.Exec(ctx, "DELETE FROM email_verifications WHERE user_id = $1;", userID)
	if err != nil {
		return err
	}
	if commandTag.RowsAffected() == 0 {
		return errors.New("no email verification record found to delete")
	}
	return nil
}
