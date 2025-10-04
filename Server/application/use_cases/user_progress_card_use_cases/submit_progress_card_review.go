package user_progress_card_use_cases

import (
	"context"
	"errors"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain"
	entities2 "go_server/Server/domain/entities"
	"go_server/Server/domain/services"
	"go_server/Server/infrastructure/models"
	"log/slog"
)

func (u *UserProgressCardUseCases) SubmitProgressCardReview(ctx context.Context, recallQuality domain.RecallQuality, progressCards []*entities2.UserProgressCard) ([]*entities2.UserProgressCard, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed getting token from metadata", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	_, err = u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed parsing access token", "err", err)
		return nil, use_cases.ErrAccessTokenInvalid
	}
	updatedCard := *progressCards[0]
	updatedCard = entities2.UpdateCardLongTermMemory(updatedCard, recallQuality)
	updatedCard = entities2.UpdateCardShortTermMemory(updatedCard, recallQuality)
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
