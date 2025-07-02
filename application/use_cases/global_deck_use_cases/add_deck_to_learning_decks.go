package global_deck_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"go_server/domain/entities"
)

func (u *GlobalDeckUseCases) AddDeckToLearningDecks(ctx context.Context, accessToken string, deckID int) (bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	deck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}
	if deck.IsPublic == false {
		return false, use_cases.ErrDeckPermissionDenied
	}
	perm, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, deckID)
	if err != nil {
		if !errors.Is(err, pgx.ErrNoRows) {
			return false, use_cases.ErrDBFailure(err)
		}
	}
	if perm != nil {
		return false, use_cases.ErrPermissionAlreadyExists
	}
	err = u.deckPermissionRepository.Create(ctx, &entities.DeckPermission{DeckID: deckID, UserID: userID, Role: "Learner"})
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}
	return true, nil
}
