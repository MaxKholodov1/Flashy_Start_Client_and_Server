package global_card_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"log/slog"
)

func (u *GlobalCardUseCases) CreateCard(ctx context.Context, question string,
	answer string, globalDeckID int, accessToken string) (int, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		slog.Error("Failed to parse the access token", "err", err)
		return 0, use_cases.ErrAccessTokenInvalid
	}
	if question == "" {
		return 0, use_cases.ErrInvalidQuestionOfTheCard
	}
	if answer == "" {
		return 0, use_cases.ErrInvalidAnswerOfTheCard
	}
	deckPermissionsByUserID, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	if err != nil {
		slog.Error("Failed to get deck permissions by UserID during creating card", "userID", userID, "err", err)
		return 0, err
	}
	var canEdit = false
	for _, permission := range deckPermissionsByUserID {
		if permission.DeckID == globalDeckID {
			if permission.Role == "Editor" || permission.Role == "Author" {
				canEdit = true
			}
		}
	}
	if canEdit == false {
		return 0, use_cases.ErrDeckPermissionDenied
	}
	var card *entities.GlobalCard
	card, err = u.globalCardRepository.CreateCard(answer, question, userID, globalDeckID, 1)
	if err != nil {
		slog.Error("Failed to create card", "err", err)
		return 0, err
	}
	return card.ID, nil
}
