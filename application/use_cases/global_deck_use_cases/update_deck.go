package global_deck_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
)

func (u *GlobalDeckUseCases) UpdateGlobalDeck(ctx context.Context, globalDeck entities.GlobalDeck, accessToken string) (*entities.GlobalDeck, *bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return nil, nil, use_cases.ErrAccessTokenInvalid
	}
	currentDeck, err := u.globalDeckRepository.GetByID(globalDeck.ID)
	if err != nil {
		return nil, nil, use_cases.ErrDBFailure(err)
	}
	isSuccess := false
	if currentDeck.Version > globalDeck.Version {
		return currentDeck, &isSuccess, nil
	}
	deckPermissionsByUserID, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	var canUpdate = false
	for _, permission := range deckPermissionsByUserID {
		if permission.DeckID == globalDeck.ID {
			if permission.Role == "Editor" || permission.Role == "Author" {
				canUpdate = true
			}
		}
	}
	if canUpdate == false {
		return nil, nil, use_cases.ErrDeckPermissionDenied
	}
	isSuccess = true
	err = u.globalDeckRepository.Update(globalDeck.ID, &globalDeck.Title, globalDeck.Description, globalDeck.Tags, globalDeck.Version+1)
	if err != nil {
		return nil, nil, use_cases.ErrDBFailure(err)
	}
	return nil, &isSuccess, nil
}
