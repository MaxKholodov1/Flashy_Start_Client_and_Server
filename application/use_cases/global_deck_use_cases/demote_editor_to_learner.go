package global_deck_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"log/slog"
)

func (u *GlobalDeckUseCases) DemoteEditorToLearner(ctx context.Context, deckID int, userToAddName string) (bool, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("failed to get token from metadata", "err", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("failed to parse token", "err", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	globalDeck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		slog.Error("failed to get global deck", "deckID", deckID, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	if globalDeck.AuthorID != userID {
		slog.Error("Deck permission denied", "deckID", deckID, "userID", userID)
		return false, use_cases.ErrDeckPermissionDenied
	}

	userToAdd, err := u.userRepository.GetByUserName(userToAddName)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			slog.Error("failed to find user", "userToAddName", userToAddName)
			return false, use_cases.ErrUserNotFound
		}
		slog.Error("failed to get user", "userToAddName", userToAddName)
		return false, use_cases.ErrDBFailure(err)
	}
	if int(userToAdd.ID) == globalDeck.AuthorID {
		return false, use_cases.ErrSuchPermissionAlreadyExists
	}
	perm, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, int(userToAdd.ID), deckID)
	if err != nil {
		if !errors.Is(err, pgx.ErrNoRows) {
			slog.Error("failed to get deck permission", "deckID", deckID, "userID", userID)
			return false, use_cases.ErrDBFailure(err)
		}
		slog.Error("failed to find deck permission", "deckID", deckID, "userID", userID)
		return false, use_cases.ErrPermissionNotFound
	}
	if perm != nil {
		if perm.Role == "Learner" {
			slog.Error("already learner", "deckID", deckID, "userID", userID)
			return false, use_cases.ErrSuchPermissionAlreadyExists
		} else if perm.Role == "Editor" {
			err = u.deckPermissionRepository.UpdateRoleByUserIDAndDeckID(ctx, int(userToAdd.ID), deckID, "Learner")
			if err != nil {
				slog.Error("failed to update deck permission", "deckID", deckID, "userID", userID, "role", "Learner")
				return false, use_cases.ErrDBFailure(err)
			}
			return true, nil
		}
		slog.Error("someone try to demote author", "deckID", deckID, "userID", userID)
		return false, use_cases.ErrPermissionNotFound
	}
	slog.Error("perm not found", "deckID", deckID, "userID", userID)
	return false, use_cases.ErrPermissionNotFound
}
