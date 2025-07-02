package global_deck_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
)

func (u *GlobalDeckUseCases) SearchGlobalDecks(ctx context.Context, query, accessToken string, limit, offset int) ([]entities.SearchResultDeck, bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return nil, false, use_cases.ErrAccessTokenInvalid
	}

	decks, hasMore, err := u.globalDeckRepository.SearchByTitleOffset(query, limit, offset)
	if err != nil {
		return nil, false, use_cases.ErrDBFailure(err)
	}

	permissions, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	if err != nil {
		return nil, false, use_cases.ErrDBFailure(err)
	}

	addedDeckIDs := make(map[int]struct{})
	for _, perm := range permissions {
		addedDeckIDs[perm.DeckID] = struct{}{}
	}

	results := make([]entities.SearchResultDeck, 0, len(decks))
	for _, deck := range decks {
		_, isAdded := addedDeckIDs[deck.ID]
		results = append(results, entities.SearchResultDeck{
			Deck:           *deck,
			IsAlreadyAdded: isAdded,
		})
	}
	return results, hasMore, nil
}
