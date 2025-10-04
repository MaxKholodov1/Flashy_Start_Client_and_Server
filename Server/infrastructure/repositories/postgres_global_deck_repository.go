package repositories

import (
	"context"
	"fmt"
	"go_server/Server/domain/entities"
	"strings"
	"time"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

type PostgresGlobalDeckRepository struct {
	db *pgxpool.Pool
}

func NewPostgresGlobalDeckRepository(db *pgxpool.Pool) *PostgresGlobalDeckRepository {
	return &PostgresGlobalDeckRepository{db: db}
}

func (r *PostgresGlobalDeckRepository) Create(title, description string, isPublic bool, authorID, version int) (int, error) {
	now := time.Now().UTC()
	query := `
		INSERT INTO global_decks (title, description, author_id, is_public, created_at, updated_at, version)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
		RETURNING id`
	var id int
	err := r.db.QueryRow(context.Background(), query,
		title,
		description,
		authorID,
		isPublic,
		now,
		now,
		version,
	).Scan(&id)
	if err != nil {
		return 0, err
	}
	return id, nil
}

func (r *PostgresGlobalDeckRepository) CreateTx(ctx context.Context, tx pgx.Tx, title, description string, isPublic bool, authorID, version int) (int, error) {
	now := time.Now().UTC()
	query := `
		INSERT INTO global_decks (title, description, author_id, is_public, created_at, updated_at, version)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
		RETURNING id`
	var id int
	err := tx.QueryRow(ctx, query,
		title,
		description,
		authorID,
		isPublic,
		now,
		now,
		version,
	).Scan(&id)
	if err != nil {
		return 0, err
	}
	return id, nil
}

func (r *PostgresGlobalDeckRepository) Update(id int, title, description *string, tags []string, version int) error {
	now := time.Now().UTC()
	query := `
		UPDATE global_decks
		SET title = $1, description = $2, tags = $3, version = $4, updated_at = $5
		WHERE id = $6`
	_, err := r.db.Exec(context.Background(), query,
		title,
		description,
		tags,
		version,
		now,
		id,
	)
	return err
}

func (r *PostgresGlobalDeckRepository) GetByID(id int) (*entities.GlobalDeck, error) {
	query := `
		SELECT id, title, description, author_id, created_at, updated_at, is_public, tags, version
		FROM global_decks
		WHERE id = $1`
	row := r.db.QueryRow(context.Background(), query, id)

	var deck entities.GlobalDeck
	err := row.Scan(
		&deck.ID,
		&deck.Title,
		&deck.Description,
		&deck.AuthorID,
		&deck.CreatedAt,
		&deck.UpdatedAt,
		&deck.IsPublic,
		&deck.Tags,
		&deck.Version,
	)
	if err != nil {
		return nil, err
	}
	return &deck, nil
}

func (r *PostgresGlobalDeckRepository) Delete(id int) error {
	query := `DELETE FROM global_decks WHERE id = $1`
	_, err := r.db.Exec(context.Background(), query, id)
	return err
}

func (r *PostgresGlobalDeckRepository) ListByUser(userID int) ([]*entities.GlobalDeck, error) {
	query := `
		SELECT id, title, description, author_id, created_at, updated_at, is_public, tags, version
		FROM global_decks
		WHERE author_id = $1
		ORDER BY created_at DESC`

	rows, err := r.db.Query(context.Background(), query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var decks []*entities.GlobalDeck
	for rows.Next() {
		var deck entities.GlobalDeck
		err := rows.Scan(
			&deck.ID,
			&deck.Title,
			&deck.Description,
			&deck.AuthorID,
			&deck.CreatedAt,
			&deck.UpdatedAt,
			&deck.IsPublic,
			&deck.Tags,
			&deck.Version,
		)
		if err != nil {
			return nil, err
		}
		decks = append(decks, &deck)
	}
	return decks, nil
}
func (r *PostgresGlobalDeckRepository) SearchByTitle(query string) ([]*entities.GlobalDeck, error) {
	searchPattern := "%" + query + "%"
	sqlQuery := `
		SELECT id, title, description, author_id, created_at, updated_at, is_public, tags, version
		FROM global_decks
		WHERE is_public = true AND title ILIKE $1
		ORDER BY created_at DESC`

	rows, err := r.db.Query(context.Background(), sqlQuery, searchPattern)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var decks []*entities.GlobalDeck
	for rows.Next() {
		var deck entities.GlobalDeck
		err := rows.Scan(
			&deck.ID,
			&deck.Title,
			&deck.Description,
			&deck.AuthorID,
			&deck.CreatedAt,
			&deck.UpdatedAt,
			&deck.IsPublic,
			&deck.Tags,
			&deck.Version,
		)
		if err != nil {
			return nil, err
		}
		decks = append(decks, &deck)
	}
	return decks, nil
}
func (r *PostgresGlobalDeckRepository) SearchByTitleOffset(query string, limit, offset int) ([]*entities.GlobalDeck, bool, error) {
	var rows pgx.Rows
	var err error

	query = strings.TrimSpace(query)
	finalLimit := limit + 1 // запрашиваем на одну больше, чтобы проверить hasMore

	if query == "" {
		sqlQuery := `
			SELECT id, title, description, author_id, created_at, updated_at, is_public, tags, version
			FROM global_decks
			WHERE is_public = true
			ORDER BY created_at DESC
			LIMIT $1 OFFSET $2;
		`
		rows, err = r.db.Query(context.Background(), sqlQuery, finalLimit, offset)
	} else {
		searchPattern := "%" + query + "%"
		sqlQuery := `
			SELECT id, title, description, author_id, created_at, updated_at, is_public, tags, version
			FROM global_decks
			WHERE is_public = true AND title ILIKE $1
			ORDER BY created_at DESC
			LIMIT $2 OFFSET $3;
		`
		rows, err = r.db.Query(context.Background(), sqlQuery, searchPattern, finalLimit, offset)
	}

	if err != nil {
		return nil, false, err
	}
	defer rows.Close()

	var decks []*entities.GlobalDeck
	for rows.Next() {
		var deck entities.GlobalDeck
		err := rows.Scan(
			&deck.ID,
			&deck.Title,
			&deck.Description,
			&deck.AuthorID,
			&deck.CreatedAt,
			&deck.UpdatedAt,
			&deck.IsPublic,
			&deck.Tags,
			&deck.Version,
		)
		if err != nil {
			return nil, false, err
		}
		decks = append(decks, &deck)
	}

	hasMore := false
	if len(decks) > limit {
		hasMore = true
		decks = decks[:limit] // убираем лишнюю
	}

	return decks, hasMore, nil
}
func (r *PostgresGlobalDeckRepository) DeleteByAuthorIDTx(ctx context.Context, tx pgx.Tx, authorID int) error {
	query := `DELETE FROM global_decks WHERE author_id = $1`
	_, err := tx.Exec(ctx, query, authorID)
	return err
}
func (r *PostgresGlobalDeckRepository) ListByUserTx(ctx context.Context, tx pgx.Tx, userID int) ([]*entities.GlobalDeck, error) {
	query := `
        SELECT id, title, description, author_id, created_at, updated_at, is_public, tags, version
        FROM global_decks
        WHERE author_id = $1
        ORDER BY created_at DESC
    `

	rows, err := tx.Query(ctx, query, userID)
	if err != nil {
		return nil, fmt.Errorf("failed to query user decks: %w", err)
	}
	defer rows.Close()

	var decks []*entities.GlobalDeck
	for rows.Next() {
		var deck entities.GlobalDeck
		err := rows.Scan(
			&deck.ID,
			&deck.Title,
			&deck.Description,
			&deck.AuthorID,
			&deck.CreatedAt,
			&deck.UpdatedAt,
			&deck.IsPublic,
			&deck.Tags,
			&deck.Version,
		)
		if err != nil {
			return nil, fmt.Errorf("failed to scan deck row: %w", err)
		}
		decks = append(decks, &deck)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("error after scanning deck rows: %w", err)
	}

	return decks, nil
}
