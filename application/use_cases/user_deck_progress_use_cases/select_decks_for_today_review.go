package user_deck_progress_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"time"
)

func (u *UserDeckProgressUseCases) SelectDecksForTodayReview(
	ctx context.Context,
	decks []*entities.UserDeckProgress,
) ([]*entities.UserDeckProgress, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return nil, use_cases.ErrAccessTokenInvalid
	}

	var resDecks []*entities.UserDeckProgress
	today := time.Now().Truncate(24 * time.Hour)

	for _, deck := range decks {
		_, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, deck.DeckID)
		if err != nil {
			return nil, use_cases.ErrDBFailure
		}

		cards, err := u.progressCardRepository.GetByUserIDAndDeckID(ctx, userID, deck.DeckID)
		if err != nil {
			return nil, use_cases.ErrDBFailure
		}

		flag := false
		for _, card := range cards {
			if card.NextReviewDate != nil && !card.NextReviewDate.IsZero() {
				nextReviewDateTruncated := card.NextReviewDate.Truncate(24 * time.Hour)
				if !nextReviewDateTruncated.After(today) {
					flag = true
					break
				}
			}
		}

		if flag {
			resDecks = append(resDecks, deck)
		}
	}
	return resDecks, nil
}
