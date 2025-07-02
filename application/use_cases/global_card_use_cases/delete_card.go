package global_card_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
)

func (u *GlobalCardUseCases) DeleteCard(ctx context.Context, cardID int, accessToken string) (bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	card, err := u.globalCardRepository.GetGlobalCardByID(cardID)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return true, nil
		}
		return false, use_cases.ErrDBFailure
	}
	deckPermission, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, card.DeckID)
	if err != nil {
		return false, use_cases.ErrDBFailure
	}
	if card.AuthorID == userID || deckPermission.Role == "Editor" {
		err = u.globalCardRepository.DeleteCardByID(cardID)
		if err != nil {
			return false, use_cases.ErrDBFailure
		}
		return true, nil
	}
	return false, use_cases.ErrDeckPermissionDenied
}
