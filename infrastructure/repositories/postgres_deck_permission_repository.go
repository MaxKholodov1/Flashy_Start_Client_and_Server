package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/domain/entities"
)

type PostgresDeckPermissionRepository struct {
	db *pgxpool.Pool
}

func NewDeckPermissionRepository(db *pgxpool.Pool) *PostgresDeckPermissionRepository {
	return &PostgresDeckPermissionRepository{db: db}
}

func (r *PostgresDeckPermissionRepository) Create(ctx context.Context, perm *entities.DeckPermission) error {
	query := `
		INSERT INTO deck_permissions (user_id, deck_id, role)
		VALUES ($1, $2, $3)
		RETURNING id
	`
	err := r.db.QueryRow(ctx, query, perm.UserID, perm.DeckID, perm.Role).Scan(&perm.ID)
	return err
}
func (r *PostgresDeckPermissionRepository) CreateTx(ctx context.Context, tx pgx.Tx, perm *entities.DeckPermission) error {
	query := `
        INSERT INTO deck_permissions (user_id, deck_id, role)
        VALUES ($1, $2, $3)
        RETURNING id
    `
	err := tx.QueryRow(ctx, query, perm.UserID, perm.DeckID, perm.Role).Scan(&perm.ID)
	return err
}
func (r *PostgresDeckPermissionRepository) GetDeckPermissionsByUserID(ctx context.Context, userID int) ([]*entities.DeckPermission, error) {
	query := `
		SELECT id, user_id, deck_id, role
		FROM deck_permissions
		WHERE user_id = $1
	`
	rows, err := r.db.Query(ctx, query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var deckPermissions []*entities.DeckPermission
	for rows.Next() {
		var deckPermission entities.DeckPermission
		if err := rows.Scan(&deckPermission.ID, &deckPermission.UserID, &deckPermission.DeckID, &deckPermission.Role); err != nil {
			return nil, err
		}
		deckPermissions = append(deckPermissions, &deckPermission)
	}
	return deckPermissions, nil
}
func (r *PostgresDeckPermissionRepository) GetDeckPermissionsByDeckID(ctx context.Context, deckID int) ([]*entities.DeckPermission, error) {
	query := `
		SELECT id, user_id, deck_id, role
		FROM deck_permissions
		WHERE deck_id = $1
	`
	rows, err := r.db.Query(ctx, query, deckID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var deckPermissions []*entities.DeckPermission
	for rows.Next() {
		var deckPermission entities.DeckPermission
		if err := rows.Scan(
			&deckPermission.ID,
			&deckPermission.UserID,
			&deckPermission.DeckID,
			&deckPermission.Role,
		); err != nil {
			return nil, err
		}
		deckPermissions = append(deckPermissions, &deckPermission)
	}

	return deckPermissions, nil
}
func (r *PostgresDeckPermissionRepository) GetDeckPermissionByUserIDAndDeckID(ctx context.Context, userID int, deckID int) (*entities.DeckPermission, error) {
	query := `
		SELECT id, user_id, deck_id, role
		FROM deck_permissions
		WHERE user_id = $1 AND deck_id = $2
		LIMIT 1
	`
	var deckPermission entities.DeckPermission
	err := r.db.QueryRow(ctx, query, userID, deckID).Scan(
		&deckPermission.ID,
		&deckPermission.UserID,
		&deckPermission.DeckID,
		&deckPermission.Role,
	)
	if err != nil {
		return nil, err // ошибка БД
	}

	return &deckPermission, nil
}
func (r *PostgresDeckPermissionRepository) UpdateRoleByUserIDAndDeckID(ctx context.Context, userID int, deckID int, newRole string) error {
	query := `
		UPDATE deck_permissions
		SET role = $1
		WHERE user_id = $2 AND deck_id = $3
	`
	_, err := r.db.Exec(ctx, query, newRole, userID, deckID)
	return err
}
func (r *PostgresDeckPermissionRepository) DeleteDeckPermissionByUserIDAndDeckIDTx(ctx context.Context, tx pgx.Tx, userID, deckID int) error {
	_, err := tx.Exec(ctx,
		`DELETE FROM deck_permissions WHERE user_id = $1 AND deck_id = $2`, userID, deckID)
	return err
}
func (r *PostgresDeckPermissionRepository) DeleteAllPermissionsForUserTx(ctx context.Context, tx pgx.Tx, userID int) error {
	query := `DELETE FROM deck_permissions WHERE user_id = $1`
	_, err := tx.Exec(ctx, query, userID)
	return err
}
