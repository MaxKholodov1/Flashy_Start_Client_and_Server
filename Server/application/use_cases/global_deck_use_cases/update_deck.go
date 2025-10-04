package global_deck_use_cases

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/entities"
	"log/slog"
)

func (u *GlobalDeckUseCases) UpdateGlobalDeck(ctx context.Context, globalDeck entities.GlobalDeck, accessToken string) (*entities.GlobalDeck, *bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("failed to parse access token", "err", err)
		return nil, nil, use_cases.ErrAccessTokenInvalid
	}
	if globalDeck.Title == "" {
		return nil, nil, use_cases.ErrInvalidTitleOfGlobalDeck
	}
	currentDeck, err := u.globalDeckRepository.GetByID(globalDeck.ID)
	if err != nil {
		slog.Error("failed to get current deck", "deckID", globalDeck.ID, "err", err)
		return nil, nil, use_cases.ErrDBFailure(err)
	}
	isSuccess := false
	if currentDeck.Version > globalDeck.Version {
		return currentDeck, &isSuccess, nil
	}
	deckPermissionsByUserID, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	if err != nil {
		slog.Error("failed to get deck permissions", "userID", userID, "err", err)
		return nil, nil, err
	}
	var canUpdate = false
	for _, permission := range deckPermissionsByUserID {
		if permission.DeckID == globalDeck.ID {
			if permission.Role == "Editor" || permission.Role == "Author" {
				canUpdate = true
			}
		}
	}
	if canUpdate == false {
		slog.Error("Deck permission denied")
		return nil, nil, use_cases.ErrDeckPermissionDenied
	}
	isSuccess = true
	err = u.globalDeckRepository.Update(globalDeck.ID, &globalDeck.Title, globalDeck.Description, globalDeck.Tags, globalDeck.Version+1)
	if err != nil {
		slog.Error("failed to update global deck", "title", globalDeck.Title, "desccription", globalDeck.Description, "err", err)
		return nil, nil, use_cases.ErrDBFailure(err)
	}
	return nil, &isSuccess, nil
}
