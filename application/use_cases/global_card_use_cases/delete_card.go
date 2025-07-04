package global_card_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"log/slog"
)

func (u *GlobalCardUseCases) DeleteCard(ctx context.Context, cardID int, accessToken string) (bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		slog.Error("Failed to parse access token", "err", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	card, err := u.globalCardRepository.GetGlobalCardByID(cardID)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return true, nil
		}
		slog.Error("Failed to get card", "err", err, "cardID", cardID)
		return false, use_cases.ErrDBFailure(err)
	}
	deckPermission, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, card.DeckID)
	if err != nil {
		slog.Error("Failed to get deck permission", "user", userID, "deckID", card.DeckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	if card.AuthorID == userID || deckPermission.Role == "Editor" {
		err = u.globalCardRepository.DeleteCardByID(cardID)
		if err != nil {
			slog.Error("Failed to delete card", "cardID", cardID, "err", err)
			return false, use_cases.ErrDBFailure(err)
		}
		return true, nil
	}
	slog.Error("Failed to delete card", "cardID", cardID, "userID", userID, "deckID", card.DeckID, "deckPermission role", deckPermission.Role)
	return false, use_cases.ErrDeckPermissionDenied
}
