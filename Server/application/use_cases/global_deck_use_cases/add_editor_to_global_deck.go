package global_deck_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/entities"
	"log/slog"
)

func (u *GlobalDeckUseCases) AddEditorToGlobalDeck(ctx context.Context, deckID int, userToAddName string) (bool, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed to get access token", "err", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed to parse access token", "err", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	globalDeck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		slog.Error("Failed to get global deck", "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	if globalDeck.AuthorID != userID {
		slog.Error("deck permission denied")
		return false, use_cases.ErrDeckPermissionDenied
	}

	userToAdd, err := u.userRepository.GetByUserName(userToAddName)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			slog.Error("Failed to get user, does not exist", "userName", userToAddName, "err", err)
			return false, use_cases.ErrUserNotFound
		}
		slog.Error("Failed to get user", "userName", userToAddName, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}
	if int(userToAdd.ID) == globalDeck.AuthorID {
		return false, use_cases.ErrSuchPermissionAlreadyExists
	}
	perm, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, int(userToAdd.ID), deckID)
	if err != nil {
		if !errors.Is(err, pgx.ErrNoRows) {
			slog.Error("Failed to get permission", "deckID", deckID, "userToAddID", userToAdd.ID, "err", err)
			return false, use_cases.ErrDBFailure(err)
		}
	}
	if perm != nil {
		if perm.Role == "Editor" {
			slog.Error("permission already exists", "deckID", deckID, "userToAddID", userToAdd.ID, "role", "Editor")
			return false, use_cases.ErrSuchPermissionAlreadyExists
		} else if perm.Role == "Learner" {
			err = u.deckPermissionRepository.UpdateRoleByUserIDAndDeckID(ctx, int(userToAdd.ID), deckID, "Editor")
			if err != nil {
				slog.Error("Failed to update role by userID and deckID", "deckID", deckID, "userToAddID", userToAdd.ID, "err", err)
				return false, use_cases.ErrDBFailure(err)
			}
			return true, nil
		}
	}

	err = u.deckPermissionRepository.Create(ctx, &entities.DeckPermission{
		UserID: int(userToAdd.ID),
		DeckID: deckID,
		Role:   "Editor",
	})
	if err != nil {
		slog.Error("failed to create deck permission", "userID", userID, "deckID", deckID, "role", "Editor")
		return false, use_cases.ErrDBFailure(err)
	}
	return true, nil
}
