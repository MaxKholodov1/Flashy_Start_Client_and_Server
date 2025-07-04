package global_deck_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"log/slog"
)

func (u *GlobalDeckUseCases) CreateDeckWithPermission(ctx context.Context, title string,
	description *string, accessToken string, isPublic bool) (int, error) {
	authID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		slog.Error("failed to parse access token", "accessToken", accessToken, "err", err)
		return 0, use_cases.ErrAccessTokenInvalid
	}
	if title == "" {
		return 0, use_cases.ErrInvalidTitleOfGlobalDeck
	}
	tx, err := u.db.Begin(ctx)
	if err != nil {
		slog.Error("failed to begin transaction", "err", err)
		return 0, use_cases.ErrDBFailure(err)
	}
	defer func() {
		if err != nil {
			tx.Rollback(ctx)
		}
	}()
	id, err := u.globalDeckRepository.CreateTx(ctx, tx, title,
		*description, isPublic, authID, 1)
	if err != nil {
		slog.Error("failed to create deck", "title", title, "description", description, "err", err)
		return 0, use_cases.ErrDBFailure(err)
	}
	var ID = id

	deckPermission := entities.DeckPermission{
		UserID: authID,
		DeckID: ID,
		Role:   "Author",
	}

	err = u.deckPermissionRepository.CreateTx(ctx, tx, &deckPermission)
	if err != nil {
		slog.Error("failed to create deck permission", "userID", deckPermission.UserID, "deckID", deckPermission.DeckID, "role", "author", "err", err)
		return 0, use_cases.ErrDBFailure(err)
	}
	err = tx.Commit(ctx)
	if err != nil {
		slog.Error("failed to commit transaction", "err", err)
		return 0, use_cases.ErrDBFailure(err)
	}
	return ID, nil
}
