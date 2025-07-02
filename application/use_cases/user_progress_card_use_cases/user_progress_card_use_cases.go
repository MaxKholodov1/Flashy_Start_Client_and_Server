package user_progress_card_use_cases

import (
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/application/services/token_services"
	"go_server/domain/repositories"
)

type UserProgressCardUseCases struct {
	db                         *pgxpool.Pool
	globalDeckRepository       repositories.GlobalDeckRepository
	deckPermissionRepository   repositories.DeckPermissionRepository
	userRepository             repositories.UserRepository
	tokenService               *token_services.TokenService
	userDeckProgressRepository repositories.UserDeckProgressRepository
	userProgressCardRepository repositories.UserProgressCardRepository
	globalCardRepository       repositories.GlobalCardRepository
}

func NewUserProgressCardUseCases(
	db *pgxpool.Pool,
	GDRepo repositories.GlobalDeckRepository,
	DPRepo repositories.DeckPermissionRepository,
	tokenService *token_services.TokenService,
	userDeckProgressRepository repositories.UserDeckProgressRepository,
	userCardProgressRepository repositories.UserProgressCardRepository,
	globalCardRepository repositories.GlobalCardRepository,

) *UserProgressCardUseCases {
	return &UserProgressCardUseCases{
		db:                         db,
		globalDeckRepository:       GDRepo,
		deckPermissionRepository:   DPRepo,
		tokenService:               tokenService,
		userDeckProgressRepository: userDeckProgressRepository,
		userProgressCardRepository: userCardProgressRepository,
		globalCardRepository:       globalCardRepository,
	}
}
