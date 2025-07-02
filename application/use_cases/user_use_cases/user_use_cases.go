package user_use_cases

import "go_server/domain/repositories"

type UserUseCases struct {
	userRepository repositories.UserRepository
}

func NewUserService(repo repositories.UserRepository) *UserUseCases {
	return &UserUseCases{userRepository: repo}
}
