package user_use_cases

import (
	"go_server/Server/application/services/token_services"
	repositories2 "go_server/Server/domain/repositories"
	"go_server/Server/interfaces"
)

type UserUseCases struct {
	userRepository              repositories2.UserRepository
	emailVerificationRepository repositories2.EmailVerificationRepository
	emailSender                 interfaces.EmailSender
	tokenService                token_services.TokenService
	globalCardRepository        repositories2.GlobalCardRepository
	globalDeckRepository        repositories2.GlobalDeckRepository
	deckPermissionRepository    repositories2.DeckPermissionRepository
}

func NewUserService(userRepo repositories2.UserRepository, emailRepo repositories2.EmailVerificationRepository,
	emailSender interfaces.EmailSender, tokenService token_services.TokenService, globalCardRepository repositories2.GlobalCardRepository,
	globalDeckRepository repositories2.GlobalDeckRepository, deckPermissionRepository repositories2.DeckPermissionRepository) *UserUseCases {
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
