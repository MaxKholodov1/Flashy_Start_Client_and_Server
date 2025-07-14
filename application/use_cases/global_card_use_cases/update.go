package global_card_use_cases

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"log/slog"
)

func (u *GlobalCardUseCases) UpdateGlobalCard(ctx context.Context, cardID, version int, question, answer string) (*entities.GlobalCard, *bool, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed to get access token", "err", err)
		return nil, nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed to parse access token", "err", err)
		return nil, nil, use_cases.ErrAccessTokenInvalid
	}
	if question == "" {
		return nil, nil, use_cases.ErrInvalidQuestionOfTheCard
	}
	if answer == "" {
		return nil, nil, use_cases.ErrInvalidAnswerOfTheCard
	}
	var currentCard *entities.GlobalCard
	currentCard, err = u.globalCardRepository.GetGlobalCardByID(cardID)
	if err != nil {
		if err == pgx.ErrNoRows {
			return nil, nil, use_cases.ErrGlobalCardNotFound
		}
		slog.Error("Failed to get current card", "cardID", cardID, "err", err)
		return nil, nil, use_cases.ErrDBFailure(err)
	}
	deckID := currentCard.DeckID
	deckPermissionsByUserID, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	if err != nil {
		slog.Error("Failed to get deck permissions", "userID", userID, "err", err)
		return nil, nil, err
	}
	var canUpdate = false
	for _, permission := range deckPermissionsByUserID {
		if permission.DeckID == deckID {
			if permission.Role == "Editor" || permission.Role == "Author" {
				canUpdate = true
			}
		}
	}
	if canUpdate == false {
		slog.Error("Deck permission denied", "cardID", cardID, "userID", userID, "deckID", deckID)
		return nil, nil, use_cases.ErrDeckPermissionDenied
	}
	var isSuccess = false
	if currentCard.Version > version {
		return currentCard, &isSuccess, nil
	}
	err = u.globalCardRepository.UpdateCardByID(cardID, question, answer, version+1)
	if err != nil {
		slog.Error("Failed to update card", "cardID", cardID, "err", err)
		return nil, nil, use_cases.ErrDBFailure(err)
	}
	isSuccess = true
	return nil, &isSuccess, nil
}
