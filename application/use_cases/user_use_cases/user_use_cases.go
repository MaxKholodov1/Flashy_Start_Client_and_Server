package user_use_cases

import (
	"go_server/domain/repositories"
	"go_server/interfaces"
)

type UserUseCases struct {
	userRepository              repositories.UserRepository
	emailVerificationRepository repositories.EmailVerificationRepository
	emailSender                 interfaces.EmailSender
}

func NewUserService(userRepo repositories.UserRepository, emailRepo repositories.EmailVerificationRepository, emailSender interfaces.EmailSender) *UserUseCases {
	return &UserUseCases{userRepository: userRepo, emailVerificationRepository: emailRepo, emailSender: emailSender}
}
