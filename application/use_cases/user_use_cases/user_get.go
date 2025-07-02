package user_use_cases

import (
	"context"
	"go_server/domain/entities"
)

func (u *UserUseCases) GetUserByID(ctx context.Context, ID int) (*entities.User, error) {
	var user *entities.User
	var err error
	user, err = u.userRepository.GetByID(ID)
	if err != nil || user == nil {
		return nil, err
	}
	return user, nil
}
