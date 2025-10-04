package user_deck_progress_use_cases

import (
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/Server/application/services/token_services"
	repositories2 "go_server/Server/domain/repositories"
)

type UserDeckProgressUseCases struct {
	db                         *pgxpool.Pool
	globalDeckRepository       repositories2.GlobalDeckRepository
	deckPermissionRepository   repositories2.DeckPermissionRepository
	userRepository             repositories2.UserRepository
	tokenService               *token_services.TokenService
	userDeckProgressRepository repositories2.UserDeckProgressRepository
	progressCardRepository     repositories2.UserProgressCardRepository
}

func NewUserDeckProgressUseCases(
	db *pgxpool.Pool,
	GDRepo repositories2.GlobalDeckRepository,
	DPRepo repositories2.DeckPermissionRepository,
	tokenService *token_services.TokenService,
	userDeckProgressRepository repositories2.UserDeckProgressRepository,
	progressCardRepository repositories2.UserProgressCardRepository,

) *UserDeckProgressUseCases {
	return &UserDeckProgressUseCases{
		db:                         db,
		globalDeckRepository:       GDRepo,
		deckPermissionRepository:   DPRepo,
		tokenService:               tokenService,
		userDeckProgressRepository: userDeckProgressRepository,
		progressCardRepository:     progressCardRepository,
	}
}
