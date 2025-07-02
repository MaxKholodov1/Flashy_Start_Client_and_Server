package global_deck_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"go_server/domain/entities"
)

func (u *GlobalDeckUseCases) AddEditorToGlobalDeck(ctx context.Context, deckID int, userToAddName string) (bool, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	globalDeck, err := u.globalDeckRepository.GetByID(deckID)
	if err != nil {
		return false, use_cases.ErrDBFailure(err)
	}
	if globalDeck.AuthorID != userID {
		return false, use_cases.ErrDeckPermissionDenied
	}

	userToAdd, err := u.userRepository.GetByUserName(userToAddName)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return false, use_cases.ErrUserNotFound
		}
		return false, use_cases.ErrDBFailure(err)
	}
	if int(userToAdd.ID) == globalDeck.AuthorID {
		return false, use_cases.ErrSuchPermissionAlreadyExists
	}
	perm, err := u.deckPermissionRepository.GetDeckPermissionByUserIDAndDeckID(ctx, int(userToAdd.ID), deckID)
	if err != nil {
		if !errors.Is(err, pgx.ErrNoRows) {
			return false, use_cases.ErrDBFailure(err)
		}
	}
	if perm != nil {
		if perm.Role == "Editor" {
			return false, use_cases.ErrSuchPermissionAlreadyExists
		} else if perm.Role == "Learner" {
			err = u.deckPermissionRepository.UpdateRoleByUserIDAndDeckID(ctx, int(userToAdd.ID), deckID, "Editor")
			if err != nil {
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
		return false, use_cases.ErrDBFailure(err)
	}
	return true, nil
}
