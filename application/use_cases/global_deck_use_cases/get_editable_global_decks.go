package global_deck_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"sort"
)

func (u *GlobalDeckUseCases) GetEditableGlobalDecks(ctx context.Context) ([]*entities.GlobalDeck, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return nil, use_cases.ErrAccessTokenInvalid
	}
	listOfDeckPermissions, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	if err != nil {
		return nil, use_cases.ErrDBFailure
	}
	var listOfEditableDecks []*entities.GlobalDeck
	for _, deckPermission := range listOfDeckPermissions {
		if deckPermission.Role == "Author" || deckPermission.Role == "Editor" {
			deck, ok := u.globalDeckRepository.GetByID(deckPermission.DeckID)
			if ok == nil {
				listOfEditableDecks = append(listOfEditableDecks, deck)
			}
		}
	}
	sort.Slice(listOfEditableDecks, func(i, j int) bool {
		return listOfEditableDecks[i].CreatedAt.After(listOfEditableDecks[j].CreatedAt)
	})
	return listOfEditableDecks, nil
}
