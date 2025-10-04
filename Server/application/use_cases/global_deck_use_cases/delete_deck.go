package global_deck_use_cases

import (
	"go_server/Server/application/use_cases"
	"golang.org/x/net/context"
	"log/slog"
)

func (u *GlobalDeckUseCases) DeleteGlobalDeck(ctx context.Context, accessToken string, deckID int) (bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("failed to parse access token", "err", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	globalDeck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		slog.Error("failed to get global deck", "deckID", deckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	if globalDeck.AuthorID != userID {
		slog.Error("Deck permission denied", "userID", userID, "deckID", deckID)
		return false, use_cases.ErrDeckPermissionDenied
	}
	err = u.globalDeckRepository.Delete(deckID)
	if err != nil {
		slog.Error("failed to delete global deck", "deckID", deckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	return true, nil
}
