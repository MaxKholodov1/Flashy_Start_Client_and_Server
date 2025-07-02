package user_deck_progress_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"go_server/domain/repositories"
	"go_server/infrastructure/models"
	"time"
)

func CreateUserDeckProgressIfNotExist(ctx context.Context, userDeckProgressRepo repositories.UserDeckProgressRepository, globalDeckRepo repositories.GlobalDeckRepository, userID int, deckID int) (*entities.UserDeckProgress, error) {
	progress, err := userDeckProgressRepo.GetByUserIDAndDeckID(ctx, userID, deckID)
	deck, err := globalDeckRepo.GetByID(deckID)
	if err != nil {
		return nil, use_cases.ErrDBFailure
	}
	if progress == nil {
		newProgress := &entities.UserDeckProgress{
			UserID:         userID,
			DeckID:         deckID,
			Title:          deck.Title,
			Description:    *deck.Description,
			LastReviewedAt: time.Time{},
			Score:          0,
		}
		_, err := userDeckProgressRepo.Create(ctx, &models.UserDeckProgressRecord{UserID: userID, DeckID: deckID, Score: 0, LastReviewedAt: time.Time{}})
		if err != nil {
			return nil, use_cases.ErrDBFailure
		}
		return newProgress, nil
	}
	return &entities.UserDeckProgress{UserID: userID, DeckID: deckID,
		Title: deck.Title, Description: *deck.Description, LastReviewedAt: progress.LastReviewedAt, Score: progress.Score}, nil
}
