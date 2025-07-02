package user_deck_progress_use_cases

import (
	"context"
	"go_server/application/use_cases"
)

func (u *UserDeckProgressUseCases) DeleteDeckFromLearningDecks(ctx context.Context, deckID int) (bool, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	perm, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, deckID)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}
	if perm.Role == "Author" {
		return false, use_cases.ErrAuthorCantDeleteProgressDeck
	}
	tx, err := u.db.Begin(ctx)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}
	defer func() {
		if err != nil {
			_ = tx.Rollback(ctx)
		}
	}()

	err = u.progressCardRepository.DeleteByDeckTx(ctx, tx, userID, deckID)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}

	err = u.userDeckProgressRepository.DeleteTx(ctx, tx, userID, deckID)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}

	err = u.deckPermissionRepository.DeleteDeckPermissionByUserIDAndDeckIDTx(ctx, tx, userID, deckID)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}

	err = tx.Commit(ctx)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}
	return true, nil
}
