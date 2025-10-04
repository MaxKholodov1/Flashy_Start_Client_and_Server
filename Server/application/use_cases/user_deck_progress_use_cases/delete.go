package user_deck_progress_use_cases

import (
	"context"
	"go_server/Server/application/use_cases"
	"log/slog"
)

func (u *UserDeckProgressUseCases) DeleteDeckFromLearningDecks(ctx context.Context, deckID int) (bool, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed getting token from metadata", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed parsing token", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	perm, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, deckID)
	if err != nil {
		slog.Error("Failed getting deck permission", "userID", userID, "deckID", deckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	if perm.Role == "Author" {
		return false, use_cases.ErrAuthorCantDeleteProgressDeck
	}
	tx, err := u.db.Begin(ctx)
	if err != nil {
		slog.Error("Failed beginning transaction", "userID", userID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	defer func() {
		if err != nil {
			_ = tx.Rollback(ctx)
		}
	}()

	err = u.progressCardRepository.DeleteByDeckTx(ctx, tx, userID, deckID)
	if err != nil {
		slog.Error("Failed deleting progress cards", "userID", userID, "deckID", deckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}

	err = u.userDeckProgressRepository.DeleteTx(ctx, tx, userID, deckID)
	if err != nil {
		slog.Error("Failed deleting progress deck", "userID", userID, "deckID", deckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}

	err = u.deckPermissionRepository.DeleteDeckPermissionByUserIDAndDeckIDTx(ctx, tx, userID, deckID)
	if err != nil {
		slog.Error("Failed deleting deck permission", "userID", userID, "deckID", deckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}

	err = tx.Commit(ctx)
	if err != nil {
		slog.Error("Failed commiting transaction", "userID", userID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	return true, nil
}
