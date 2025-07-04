package user_progress_card_use_cases

import (
	"context"
	"errors"
	"go_server/application/use_cases"
	"go_server/domain"
	"go_server/domain/entities"
	"go_server/domain/services"
	"go_server/infrastructure/models"
	"log/slog"
)

func (u *UserProgressCardUseCases) SubmitProgressCardReview(ctx context.Context, recallQuality domain.RecallQuality, progressCards []*entities.UserProgressCard) ([]*entities.UserProgressCard, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed getting token from metadata", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	_, err = u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		slog.Error("Failed parsing access token", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	updatedCard := *progressCards[0]
	updatedCard = entities.UpdateCardLongTermMemory(updatedCard, recallQuality)
	updatedCard = entities.UpdateCardShortTermMemory(updatedCard, recallQuality)
	updatedCard.RepetitionCount += 1
	progressCards[0] = &updatedCard

	err = u.userProgressCardRepository.Update(ctx, &models.UserProgressCardRecord{
		DeckID:          updatedCard.DeckID,
		UserID:          updatedCard.UserID,
		CardID:          updatedCard.CardID,
		NextReviewDate:  updatedCard.NextReviewDate,
		LastReviewedAt:  updatedCard.LastReviewedAt,
		ShortTermMemory: updatedCard.ShortTermMemory,
		LongTermMemory:  updatedCard.LongTermMemory,
		RepetitionCount: updatedCard.RepetitionCount,
	})

	if err != nil {
		if !errors.Is(err, use_cases.ErrNoRowsUpdated) {
			slog.Error("Failed updating progress card", "err", err)
			return nil, err
		}
	}

	cards := services.ShuffleProgressCards(progressCards)
	return cards, nil

}
