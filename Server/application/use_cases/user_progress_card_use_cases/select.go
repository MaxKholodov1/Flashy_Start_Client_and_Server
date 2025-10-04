package user_progress_card_use_cases

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/entities"
	"log/slog"
)

func (u *UserProgressCardUseCases) SelectNewProgressCards(ctx context.Context, cards []*entities.UserProgressCard) ([]*entities.UserProgressCard, error) {
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
	var newCards []*entities.UserProgressCard
	for _, card := range cards {
		if card.LongTermMemory == 0 {
			newCards = append(newCards, card)
		}
	}
	return newCards, nil
}

func (u *UserProgressCardUseCases) SelectFamiliarProgressCards(ctx context.Context, cards []*entities.UserProgressCard) ([]*entities.UserProgressCard, error) {
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
	var newCards []*entities.UserProgressCard
	for _, card := range cards {
		if card.LongTermMemory != 0 {
			newCards = append(newCards, card)
		}
	}
	return newCards, nil
}
