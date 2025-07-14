package user_use_cases

import (
	"go_server/application/services/token_services"
	"go_server/domain/repositories"
	"go_server/interfaces"
)

type UserUseCases struct {
	userRepository              repositories.UserRepository
	emailVerificationRepository repositories.EmailVerificationRepository
	emailSender                 interfaces.EmailSender
	tokenService                token_services.TokenService
}

func NewUserService(userRepo repositories.UserRepository, emailRepo repositories.EmailVerificationRepository, emailSender interfaces.EmailSender, tokenService token_services.TokenService) *UserUseCases {
	return &UserUseCases{userRepository: userRepo, emailVerificationRepository: emailRepo, emailSender: emailSender, tokenService: tokenService}
}
