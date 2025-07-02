package global_card_use_cases

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"go_server/domain/entities"
)

func (u *GlobalCardUseCases) UpdateGlobalCard(ctx context.Context, cardID, version int, question, answer string) (*entities.GlobalCard, *bool, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return nil, nil, use_cases.ErrAccessTokenInvalid
	}
	var currentCard *entities.GlobalCard
	currentCard, err = u.globalCardRepository.GetGlobalCardByID(cardID)
	if err != nil {
		if err == pgx.ErrNoRows {
			return nil, nil, use_cases.ErrGlobalCardNotFound
		}
		return nil, nil, use_cases.ErrDBFailure(err)
	}
	deckID := currentCard.DeckID
	deckPermissionsByUserID, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	var canUpdate = false
	for _, permission := range deckPermissionsByUserID {
		if permission.DeckID == deckID {
			if permission.Role == "Editor" || permission.Role == "Author" {
				canUpdate = true
			}
		}
	}
	if canUpdate == false {
		return nil, nil, use_cases.ErrDeckPermissionDenied
	}
	var isSuccess = false
	if currentCard.Version > version {
		return currentCard, &isSuccess, nil
	}
	err = u.globalCardRepository.UpdateCardByID(cardID, question, answer, version+1)
	if err != nil {
		return nil, nil, use_cases.ErrDBFailure(err)
	}
	isSuccess = true
	return nil, &isSuccess, nil
}
