package user_progress_card_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/entities"
	"go_server/Server/infrastructure/models"
	"log/slog"
	"time"
)

func (u *UserProgressCardUseCases) GetProgressCardsByDeckID(ctx context.Context, deckID int) ([]*entities.UserProgressCard, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed getting token from metadata", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed parsing access token", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	globalDeck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		slog.Error("Failed getting globalDeck", "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	permission, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, deckID)
	if err != nil {
		slog.Error("Failed getting permission", "userID", userID, "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	if globalDeck.IsPublic == false && (permission.Role != "Editor" && permission.Role != "Author") {
		slog.Error("deck permission denied", "userID", userID, "deckID", deckID)
		return nil, use_cases.ErrDeckPermissionDenied
	}
	globalCards, err := u.globalCardRepository.GetCardsByDeckID(deckID)
	if err != nil {
		slog.Error("Failed getting globalCards", "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	userProgressCards := make([]*entities.UserProgressCard, 0)
	for _, card := range globalCards {
		progress, err := u.userProgressCardRepository.GetByUserIDAndCardID(ctx, userID, card.ID)
		if err != nil && !errors.Is(err, pgx.ErrNoRows) {
			slog.Error("Failed getting progress card", "userID", userID, "cardID", card.ID, "err", err)
			return nil, use_cases.ErrDBFailure(err)
		}

		if progress == nil {
			newRecord := &models.UserProgressCardRecord{
				UserID:          userID,
				CardID:          card.ID,
				NextReviewDate:  nil,
				LastReviewedAt:  nil,
				ShortTermMemory: 0,
				LongTermMemory:  0,
				RepetitionCount: 0,
				DeckID:          deckID,
			}

			_, err := u.userProgressCardRepository.Create(ctx, newRecord)
			if err != nil {
				slog.Error("Failed creating progress card", "userID", userID, "cardID", card.ID, "err", err)
				return nil, use_cases.ErrDBFailure(err)
			}
			progress = newRecord
		}
		userProgressCards = append(userProgressCards, &entities.UserProgressCard{
			CardID:          card.ID,
			UserID:          userID,
			Question:        card.Question,
			Answer:          card.Answer,
			NextReviewDate:  progress.NextReviewDate,
			LastReviewedAt:  progress.LastReviewedAt,
			ShortTermMemory: progress.ShortTermMemory,
			LongTermMemory:  progress.LongTermMemory,
			RepetitionCount: progress.RepetitionCount,
			DeckID:          deckID,
		})
	}
	return userProgressCards, nil
}

func (u *UserProgressCardUseCases) GetCardsForTodayReview(ctx context.Context, deckID int) ([]*entities.UserProgressCard, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed getting token from metadata", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed parsing access token", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	globalDeck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		slog.Error("Failed getting globalDeck", "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	permission, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, deckID)
	if err != nil {
		slog.Error("Failed getting permission", "userID", userID, "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	if globalDeck.IsPublic == false && (permission.Role != "Editor" && permission.Role != "Author") {
		slog.Error("deck permission denied", "userID", userID, "deckID", deckID)
		return nil, use_cases.ErrDeckPermissionDenied
	}
	globalCards, err := u.globalCardRepository.GetCardsByDeckID(deckID)
	if err != nil {
		slog.Error("Failed getting globalCards", "deckID", deckID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}
	userProgressCards := make([]*entities.UserProgressCard, 0)
	for _, card := range globalCards {
		progress, err := u.userProgressCardRepository.GetByUserIDAndCardID(ctx, userID, card.ID)
		if err != nil && !errors.Is(err, pgx.ErrNoRows) {
			slog.Error("Failed getting progress card", "userID", userID, "cardID", card.ID, "err", err)
			return nil, use_cases.ErrDBFailure(err)
		}

		if progress == nil {
			newRecord := &models.UserProgressCardRecord{
				UserID:          userID,
				CardID:          card.ID,
				NextReviewDate:  nil,
				LastReviewedAt:  nil,
				ShortTermMemory: 0,
				LongTermMemory:  0,
				RepetitionCount: 0,
				DeckID:          deckID,
			}

			_, err := u.userProgressCardRepository.Create(ctx, newRecord)
			if err != nil {
				slog.Error("Failed creating progress card", "userID", userID, "err", err)
				return nil, use_cases.ErrDBFailure(err)
			}
			progress = newRecord
		}
		userProgressCards = append(userProgressCards, &entities.UserProgressCard{
			CardID:          card.ID,
			UserID:          userID,
			Question:        card.Question,
			Answer:          card.Answer,
			NextReviewDate:  progress.NextReviewDate,
			LastReviewedAt:  progress.LastReviewedAt,
			ShortTermMemory: progress.ShortTermMemory,
			LongTermMemory:  progress.LongTermMemory,
			RepetitionCount: progress.RepetitionCount,
			DeckID:          deckID,
		})
	}
	today := time.Now().UTC().Truncate(24 * time.Hour)
	cardsForTodayReview := make([]*entities.UserProgressCard, 0)
	for _, card := range userProgressCards {
		if card.NextReviewDate == nil || card.NextReviewDate.IsZero() {
			continue
		}
		cardDate := card.NextReviewDate.UTC().Truncate(24 * time.Hour)
		if !cardDate.After(today) {
			cardsForTodayReview = append(cardsForTodayReview, card)
		}
	}
	return cardsForTodayReview, nil
}
