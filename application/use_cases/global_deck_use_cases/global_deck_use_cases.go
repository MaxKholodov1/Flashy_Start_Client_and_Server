package global_deck_use_cases

import (
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/application/services/token_services"
	"go_server/domain/repositories"
)

type GlobalDeckUseCases struct {
	db                       *pgxpool.Pool
	globalDeckRepository     repositories.GlobalDeckRepository
	deckPermissionRepository repositories.DeckPermissionRepository
	userRepository           repositories.UserRepository
	tokenService             *token_services.TokenService
}

func NewGlobalDeckUseCases(
	db *pgxpool.Pool,
	GDRepo repositories.GlobalDeckRepository,
	DPRepo repositories.DeckPermissionRepository,
	tokenService *token_services.TokenService,
	userRepository repositories.UserRepository,
) *GlobalDeckUseCases {
	return &GlobalDeckUseCases{
		db:                       db,
		globalDeckRepository:     GDRepo,
		deckPermissionRepository: DPRepo,
		tokenService:             tokenService,
		userRepository:           userRepository,
	}
}
