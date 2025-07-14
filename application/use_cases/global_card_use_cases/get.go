package global_card_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"log/slog"
	"sort"
)

func (u *GlobalCardUseCases) GetGlobalCardsByDeckID(ctx context.Context, deckID int) ([]*entities.GlobalCard, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed to get token", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed to parse token", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	deck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		slog.Error("Failed to get deck", "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	authorID := deck.AuthorID
	var permissions []*entities.DeckPermission
	permissions, err = u.deckPermissionRepository.GetDeckPermissionsByDeckID(ctx, deckID)
	if err != nil {
		slog.Error("Failed to get permissions", "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	var isEditor = false
	for _, permission := range permissions {
		if permission.Role == "Editor" {
			if permission.UserID == userID {
				isEditor = true
			}
		}
	}
	if deck.IsPublic == false && authorID != userID && isEditor == false {
		slog.Error("deck permission denied", "deckID", deckID, "userID", userID)
		return nil, use_cases.ErrDeckPermissionDenied
	}

	var listOfGlobalCards []*entities.GlobalCard
	listOfGlobalCards, err = u.globalCardRepository.GetCardsByDeckID(deckID)
	if err != nil {
		slog.Error("Failed to get cards", "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	sort.Slice(listOfGlobalCards, func(i, j int) bool {
		return listOfGlobalCards[i].CreatedAt.After(listOfGlobalCards[j].CreatedAt)
	})
	return listOfGlobalCards, nil
}
