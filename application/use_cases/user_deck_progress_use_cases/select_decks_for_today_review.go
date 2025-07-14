package user_deck_progress_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"log/slog"
	"time"
)

func (u *UserDeckProgressUseCases) SelectDecksForTodayReview(ctx context.Context, decks []*entities.UserDeckProgress) ([]*entities.UserDeckProgress, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed getting token from metadata", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed parsing token", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}

	var resDecks []*entities.UserDeckProgress
	today := time.Now().Truncate(24 * time.Hour)

	for _, deck := range decks {
		_, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, deck.DeckID)
		if err != nil {
			slog.Error("Failed getting deck permission", "deckID", deck.DeckID, "userID", userID, "err", err)
			return nil, use_cases.ErrDBFailure(err)
		}

		cards, err := u.progressCardRepository.GetByUserIDAndDeckID(ctx, userID, deck.DeckID)
		if err != nil {
			slog.Error("Failed getting progress card", "deckID", deck.DeckID, "userID", userID, "err", err)
			return nil, use_cases.ErrDBFailure(err)
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
