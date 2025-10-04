package user_progress_card_use_cases

import (
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/Server/application/services/token_services"
	repositories2 "go_server/Server/domain/repositories"
)

type UserProgressCardUseCases struct {
	db                         *pgxpool.Pool
	globalDeckRepository       repositories2.GlobalDeckRepository
	deckPermissionRepository   repositories2.DeckPermissionRepository
	userRepository             repositories2.UserRepository
	tokenService               *token_services.TokenService
	userDeckProgressRepository repositories2.UserDeckProgressRepository
	userProgressCardRepository repositories2.UserProgressCardRepository
	globalCardRepository       repositories2.GlobalCardRepository
}

func NewUserProgressCardUseCases(
	db *pgxpool.Pool,
	GDRepo repositories2.GlobalDeckRepository,
	DPRepo repositories2.DeckPermissionRepository,
	tokenService *token_services.TokenService,
	userDeckProgressRepository repositories2.UserDeckProgressRepository,
	userCardProgressRepository repositories2.UserProgressCardRepository,
	globalCardRepository repositories2.GlobalCardRepository,

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
