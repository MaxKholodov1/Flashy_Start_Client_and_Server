package user_deck_progress_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"log/slog"
)

func (u *UserDeckProgressUseCases) GetUserLearningProgressDecks(ctx context.Context, userID int) ([]*entities.UserDeckProgress, error) {
	deckPermissions, err := u.deckPermissionRepository.GetDeckPermissionsByUserID(ctx, userID)
	if err != nil {
		slog.Error("Failed getting deck permissions", "userID", userID, "err", err)
		return nil, use_cases.ErrDBFailure(err)
	}

	var result []*entities.UserDeckProgress

	for _, dp := range deckPermissions {
		progress, err := CreateUserDeckProgressIfNotExist(ctx, u.userDeckProgressRepository, u.globalDeckRepository, userID, dp.DeckID)
		if err != nil {
			return nil, err
		}
		result = append(result, progress)
	}
	return result, nil
}
