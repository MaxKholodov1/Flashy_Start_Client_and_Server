package repositories

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"go_server/Server/domain/entities"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
)

type PostgresGlobalCardRepository struct {
	db *pgxpool.Pool
}

func NewPostgresGlobalCardRepository(db *pgxpool.Pool) *PostgresGlobalCardRepository {
	return &PostgresGlobalCardRepository{db: db}
}

func (r *PostgresGlobalCardRepository) CreateCard(answer, question string, authorID, deckID, version int) (*entities.GlobalCard, error) {
	ctx := context.Background()
	now := time.Now().UTC()

	var id int
	err := r.db.QueryRow(
		ctx,
		`
		INSERT INTO global_cards (deck_id, question, answer, author_id, created_at, updated_at, version)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
		RETURNING id
		`,
		deckID, question, answer, authorID, now, now, version,
	).Scan(&id)

	if err != nil {
		return nil, err
	}

	return &entities.GlobalCard{
		ID:        id,
		DeckID:    deckID,
		Question:  question,
		Answer:    answer,
		AuthorID:  authorID,
		CreatedAt: now,
		UpdatedAt: now,
		Version:   version,
	}, nil
}

func (r *PostgresGlobalCardRepository) GetCardsByDeckID(deckID int) ([]*entities.GlobalCard, error) {
	ctx := context.Background()

	rows, err := r.db.Query(
		ctx,
		`
		SELECT id, deck_id, question, answer, author_id, created_at, updated_at, version
		FROM global_cards
		WHERE deck_id = $1
		`,
		deckID,
	)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var cards []*entities.GlobalCard
	for rows.Next() {
		var c entities.GlobalCard
		err := rows.Scan(
			&c.ID, &c.DeckID, &c.Question, &c.Answer,
			&c.AuthorID, &c.CreatedAt, &c.UpdatedAt, &c.Version,
		)
		if err != nil {
			return nil, err
		}
		cards = append(cards, &c)
	}

	if err = rows.Err(); err != nil {
		return nil, err
	}

	return cards, nil
}
func (r *PostgresGlobalCardRepository) GetGlobalCardByID(cardID int) (*entities.GlobalCard, error) {
	ctx := context.Background()

	row := r.db.QueryRow(
		ctx,
		`
		SELECT id, deck_id, question, answer, author_id, created_at, updated_at, version
		FROM global_cards
		WHERE id = $1
		`, cardID,
	)

	var card entities.GlobalCard
	err := row.Scan(
		&card.ID,
		&card.DeckID,
		&card.Question,
		&card.Answer,
		&card.AuthorID,
		&card.CreatedAt,
		&card.UpdatedAt,
		&card.Version,
	)
	if err != nil {
		return nil, err
	}

	return &card, nil
}

func (r *PostgresGlobalCardRepository) UpdateCardByID(id int, question, answer string, version int) error {
	ctx := context.Background()
	now := time.Now().UTC()

	_, err := r.db.Exec(
		ctx,
		`
		UPDATE global_cards
		SET question = $1, answer = $2, updated_at = $3, version = $4
		WHERE id = $5
		`,
		question, answer, now, version, id,
	)
	return err
}
func (r *PostgresGlobalCardRepository) DeleteCardByID(cardID int) error {
	ctx := context.Background()

	_, err := r.db.Exec(
		ctx,
		`DELETE FROM global_cards WHERE id = $1`,
		cardID,
	)
	return err
}
func (r *PostgresGlobalCardRepository) DeleteCardsByAuthorIDTX(ctx context.Context, tx pgx.Tx, authorID int) error {
	_, err := tx.Exec(
		ctx,
		`DELETE FROM global_cards WHERE author_id = $1`,
		authorID,
	)
	return err
}

// DeleteByDeckIDTx удаляет все карточки в указанной колоде (в транзакции)
func (r *PostgresGlobalCardRepository) DeleteByDeckIDTx(ctx context.Context, tx pgx.Tx, deckID int) error {
	query := `DELETE FROM global_cards WHERE deck_id = $1`

	// Выполняем запрос в транзакции
	_, err := tx.Exec(ctx, query, deckID)
	if err != nil {
		return fmt.Errorf("failed to delete cards for deck %d: %w", deckID, err)
	}

	return nil
}
