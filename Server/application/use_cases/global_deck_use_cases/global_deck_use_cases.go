package global_deck_use_cases

import (
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/Server/application/services/token_services"
	repositories2 "go_server/Server/domain/repositories"
)

type GlobalDeckUseCases struct {
	db                       *pgxpool.Pool
	globalDeckRepository     repositories2.GlobalDeckRepository
	deckPermissionRepository repositories2.DeckPermissionRepository
	userRepository           repositories2.UserRepository
	tokenService             *token_services.TokenService
}

func NewGlobalDeckUseCases(
	db *pgxpool.Pool,
	GDRepo repositories2.GlobalDeckRepository,
	DPRepo repositories2.DeckPermissionRepository,
	tokenService *token_services.TokenService,
	userRepository repositories2.UserRepository,
) *GlobalDeckUseCases {
	return &GlobalDeckUseCases{
		db:                       db,
		globalDeckRepository:     GDRepo,
		deckPermissionRepository: DPRepo,
		tokenService:             tokenService,
		userRepository:           userRepository,
	}
}
