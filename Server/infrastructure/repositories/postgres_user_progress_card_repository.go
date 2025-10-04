package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/Server/application/use_cases"
	"go_server/Server/infrastructure/models"
)

type PostgresUserProgressCardRepository struct {
	pool *pgxpool.Pool
}

func NewPostgresUserProgressCardRepository(pool *pgxpool.Pool) *PostgresUserProgressCardRepository {
	return &PostgresUserProgressCardRepository{pool: pool}
}

func (r *PostgresUserProgressCardRepository) Create(ctx context.Context, record *models.UserProgressCardRecord) (int, error) {
	query := `
		INSERT INTO user_progress_cards (
			user_id, deck_id, card_id, next_review_date, last_reviewed_at,
			short_term_memory, long_term_memory, repetition_count
		) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
		RETURNING card_id
	`
	var id int
	err := r.pool.QueryRow(ctx, query,
		record.UserID,
		record.DeckID,
		record.CardID,
		record.NextReviewDate,
		record.LastReviewedAt,
		record.ShortTermMemory,
		record.LongTermMemory,
		record.RepetitionCount,
	).Scan(&id)
	return id, err
}

func (r *PostgresUserProgressCardRepository) GetByUserID(ctx context.Context, userID int) ([]*models.UserProgressCardRecord, error) {
	query := `
		SELECT user_id, deck_id, card_id, next_review_date, last_reviewed_at,
		       short_term_memory, long_term_memory, repetition_count
		FROM user_progress_cards
		WHERE user_id = $1
	`
	rows, err := r.pool.Query(ctx, query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var records []*models.UserProgressCardRecord
	for rows.Next() {
		record := new(models.UserProgressCardRecord)
		err := rows.Scan(
			&record.UserID,
			&record.DeckID,
			&record.CardID,
			&record.NextReviewDate,
			&record.LastReviewedAt,
			&record.ShortTermMemory,
			&record.LongTermMemory,
			&record.RepetitionCount,
		)
		if err != nil {
			return nil, err
		}
		records = append(records, record)
	}
	return records, rows.Err()
}

func (r *PostgresUserProgressCardRepository) GetByUserIDAndCardID(ctx context.Context, userID int, cardID int) (*models.UserProgressCardRecord, error) {
	query := `
		SELECT user_id, deck_id, card_id, next_review_date, last_reviewed_at,
		       short_term_memory, long_term_memory, repetition_count
		FROM user_progress_cards
		WHERE user_id = $1 AND card_id = $2
	`
	record := new(models.UserProgressCardRecord)
	err := r.pool.QueryRow(ctx, query, userID, cardID).Scan(
		&record.UserID,
		&record.DeckID,
		&record.CardID,
		&record.NextReviewDate,
		&record.LastReviewedAt,
		&record.ShortTermMemory,
		&record.LongTermMemory,
		&record.RepetitionCount,
	)
	if err != nil {
		return nil, err
	}
	return record, nil
}

func (r *PostgresUserProgressCardRepository) Update(ctx context.Context, record *models.UserProgressCardRecord) error {
	query := `
		UPDATE user_progress_cards
		SET next_review_date = $1,
		    last_reviewed_at = $2,
		    short_term_memory = $3,
		    long_term_memory = $4,
		    repetition_count = $5
		WHERE user_id = $6 AND card_id = $7 AND deck_id = $8
	`
	cmdTag, err := r.pool.Exec(ctx, query,
		record.NextReviewDate,
		record.LastReviewedAt,
		record.ShortTermMemory,
		record.LongTermMemory,
		record.RepetitionCount,
		record.UserID,
		record.CardID,
		record.DeckID,
	)
	if err != nil {
		return err
	}
	if cmdTag.RowsAffected() == 0 {
		return use_cases.ErrNoRowsUpdated
	}
	return nil
}
func (r *PostgresUserProgressCardRepository) GetByUserIDAndDeckID(ctx context.Context, userID int, deckID int) ([]*models.UserProgressCardRecord, error) {
	query := `
		SELECT user_id, deck_id, card_id, next_review_date, last_reviewed_at,
		       short_term_memory, long_term_memory, repetition_count
		FROM user_progress_cards
		WHERE user_id = $1 AND deck_id = $2
	`
	rows, err := r.pool.Query(ctx, query, userID, deckID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var records []*models.UserProgressCardRecord
	for rows.Next() {
		record := new(models.UserProgressCardRecord)
		err := rows.Scan(
			&record.UserID,
			&record.DeckID,
			&record.CardID,
			&record.NextReviewDate,
			&record.LastReviewedAt,
			&record.ShortTermMemory,
			&record.LongTermMemory,
			&record.RepetitionCount,
		)
		if err != nil {
			return nil, err
		}
		records = append(records, record)
	}

	return records, rows.Err()
}
func (r *PostgresUserProgressCardRepository) DeleteByDeckTx(ctx context.Context, tx pgx.Tx, userID, deckID int) error {
	_, err := tx.Exec(ctx,
		`DELETE FROM user_progress_cards WHERE user_id = $1 AND deck_id = $2`, userID, deckID)
	return err
}
