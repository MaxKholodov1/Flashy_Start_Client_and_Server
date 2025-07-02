package global_deck_use_cases

import (
	"go_server/application/use_cases"
	"golang.org/x/net/context"
)

func (u *GlobalDeckUseCases) DeleteGlobalDeck(ctx context.Context, accessToken string, deckID int) (bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	globalDeck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		return false, use_cases.ErrDBFailure
	}
	if globalDeck.AuthorID != userID {
		return false, use_cases.ErrDeckPermissionDenied
	}
	err = u.globalDeckRepository.Delete(deckID)
	if err != nil {
		return false, use_cases.ErrDBFailure
	}
	return true, nil
}
