package user_progress_card_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
)

func (u *UserProgressCardUseCases) SelectNewProgressCards(ctx context.Context, cards []*entities.UserProgressCard) ([]*entities.UserProgressCard, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, use_cases.ErrAccessTokenInvalid
	}
	_, err = u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
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
		return nil, use_cases.ErrAccessTokenInvalid
	}
	_, err = u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
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
