package global_deck_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/entities"
	"log/slog"
)

func (u *GlobalDeckUseCases) AddDeckToLearningDecks(ctx context.Context, accessToken string, deckID int) (bool, error) {
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed to parse access token", "err", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	deck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		slog.Error("Failed to get deck", "deckID", deckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	if deck.IsPublic == false {
		slog.Error("Deck permission denied", "deckID", deckID)
		return false, use_cases.ErrDeckPermissionDenied
	}
	perm, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, userID, deckID)
	if err != nil {
		if !errors.Is(err, pgx.ErrNoRows) {
			slog.Error("Failed to get deck permission", "userID", userID, "deckID", deckID, "err", err)
			return false, use_cases.ErrDBFailure(err)
		}
	}
	if perm != nil {
		slog.Error("Deck permission already exists", "userID", userID, "deckID", deckID, "perm", perm)
		return false, use_cases.ErrPermissionAlreadyExists
	}
	err = u.deckPermissionRepository.Create(ctx, &entities.DeckPermission{DeckID: deckID, UserID: userID, Role: "Learner"})
	if err != nil {
		slog.Error("Failed to create deck permission", "userID", userID, "deckID", deckID, "role", "Learner", "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	return true, nil
}
