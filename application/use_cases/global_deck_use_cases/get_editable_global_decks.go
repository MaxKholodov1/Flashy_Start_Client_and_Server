package global_deck_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"log/slog"
	"sort"
)

func (u *GlobalDeckUseCases) GetEditableGlobalDecks(ctx context.Context) ([]*entities.GlobalDeck, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("failed to get token from metadata", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		slog.Error("failed to parse token", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	listOfDeckPermissions, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	if err != nil {
		slog.Error("failed to get deck permissions", "userID", userID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	var listOfEditableDecks []*entities.GlobalDeck
	for _, deckPermission := range listOfDeckPermissions {
		if deckPermission.Role == "Author" || deckPermission.Role == "Editor" {
			deck, ok := u.globalDeckRepository.GetByID(deckPermission.DeckID)
			if ok == nil {
				listOfEditableDecks = append(listOfEditableDecks, deck)
			} else {
				slog.Error("failed to get editable deck", "deckID", deckPermission.DeckID, "userID", userID, "err", ok)
			}
		}
	}
	sort.Slice(listOfEditableDecks, func(i, j int) bool {
		return listOfEditableDecks[i].CreatedAt.After(listOfEditableDecks[j].CreatedAt)
	})
	return listOfEditableDecks, nil
}
