package user_use_cases

import (
	"context"
	"go_server/Server/domain/entities"
	"log/slog"
)

func (u *UserUseCases) GetUserByID(ctx context.Context, ID int) (*entities.User, error) {
	var user *entities.User
	var err error
	user, err = u.userRepository.GetByID(ID)
	if err != nil || user == nil {
		slog.Error("Failed getting user by ID", "userID", ID, "err", err)
		return nil, err
	}
	return user, nil
}
