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
	globalCardRepository        repositories.GlobalCardRepository
	globalDeckRepository        repositories.GlobalDeckRepository
	deckPermissionRepository    repositories.DeckPermissionRepository
}

func NewUserService(userRepo repositories.UserRepository, emailRepo repositories.EmailVerificationRepository,
	emailSender interfaces.EmailSender, tokenService token_services.TokenService, globalCardRepository repositories.GlobalCardRepository,
	globalDeckRepository repositories.GlobalDeckRepository, deckPermissionRepository repositories.DeckPermissionRepository) *UserUseCases {
	return &UserUseCases{
		userRepository:              userRepo,
		emailVerificationRepository: emailRepo,
		emailSender:                 emailSender,
		tokenService:                tokenService,
		globalCardRepository:        globalCardRepository,
		globalDeckRepository:        globalDeckRepository,
		deckPermissionRepository:    deckPermissionRepository,
	}
}
