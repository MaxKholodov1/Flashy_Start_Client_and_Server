package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/infrastructure/models"
)

type PostgresUserDeckProgressRepository struct {
	db *pgxpool.Pool
}

func NewPostgresUserDeckProgressRepository(db *pgxpool.Pool) *PostgresUserDeckProgressRepository {
	return &PostgresUserDeckProgressRepository{db: db}
}

func (r *PostgresUserDeckProgressRepository) Create(ctx context.Context, record *models.UserDeckProgressRecord) (int, error) {
	_, err := r.db.Exec(ctx,
		`INSERT INTO user_deck_progress  (user_id, deck_id, last_reviewed_at, score)
		 VALUES ($1, $2, $3, $4)`,
		record.UserID, record.DeckID, record.LastReviewedAt, record.Score)
	if err != nil {
		return 0, err
	}
	return 1, nil
}

func (r *PostgresUserDeckProgressRepository) GetByDeckID(ctx context.Context, deckID int) ([]*models.UserDeckProgressRecord, error) {
	rows, err := r.db.Query(ctx,
		`SELECT user_id, deck_id, last_reviewed_at, score FROM user_deck_progress  WHERE deck_id = $1`, deckID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var records []*models.UserDeckProgressRecord
	for rows.Next() {
		var rec models.UserDeckProgressRecord
		err := rows.Scan(&rec.UserID, &rec.DeckID, &rec.LastReviewedAt, &rec.Score)
		if err != nil {
			return nil, err
		}
		records = append(records, &rec)
	}
	return records, nil
}

func (r *PostgresUserDeckProgressRepository) GetByUserID(ctx context.Context, userID int) ([]*models.UserDeckProgressRecord, error) {
	rows, err := r.db.Query(ctx,
		`SELECT user_id, deck_id, last_reviewed_at, score FROM user_deck_progress  WHERE user_id = $1`, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var records []*models.UserDeckProgressRecord
	for rows.Next() {
		var rec models.UserDeckProgressRecord
		err := rows.Scan(&rec.UserID, &rec.DeckID, &rec.LastReviewedAt, &rec.Score)
		if err != nil {
			return nil, err
		}
		records = append(records, &rec)
	}
	return records, nil
}

func (r *PostgresUserDeckProgressRepository) GetByUserIDAndDeckID(ctx context.Context, userID int, deckID int) (*models.UserDeckProgressRecord, error) {
	row := r.db.QueryRow(ctx,
		`SELECT user_id, deck_id, last_reviewed_at, score FROM user_deck_progress  WHERE user_id = $1 AND deck_id = $2`,
		userID, deckID)

	var rec models.UserDeckProgressRecord
	err := row.Scan(&rec.UserID, &rec.DeckID, &rec.LastReviewedAt, &rec.Score)
	if err != nil {
		return nil, err
	}
	return &rec, nil
}

func (r *PostgresUserDeckProgressRepository) Update(ctx context.Context, record *models.UserDeckProgressRecord) error {
	_, err := r.db.Exec(ctx,
		`UPDATE user_deck_progress  SET last_reviewed_at = $1, score = $2 WHERE user_id = $3 AND deck_id = $4`,
		record.LastReviewedAt, record.Score, record.UserID, record.DeckID)
	return err
}

func (r *PostgresUserDeckProgressRepository) Delete(ctx context.Context, userID int, deckID int) error {
	_, err := r.db.Exec(ctx,
		`DELETE FROM user_deck_progress  WHERE user_id = $1 AND deck_id = $2`, userID, deckID)
	return err
}
func (r *PostgresUserDeckProgressRepository) DeleteTx(ctx context.Context, tx pgx.Tx, userID, deckID int) error {
	_, err := tx.Exec(ctx,
		`DELETE FROM user_deck_progress WHERE user_id = $1 AND deck_id = $2`, userID, deckID)
	return err
}
