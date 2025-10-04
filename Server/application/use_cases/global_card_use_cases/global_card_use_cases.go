package global_card_use_cases

import (
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/Server/application/services/token_services"
	repositories2 "go_server/Server/domain/repositories"
)

type GlobalCardUseCases struct {
	db                       *pgxpool.Pool
	globalCardRepository     repositories2.GlobalCardRepository
	deckPermissionRepository repositories2.DeckPermissionRepository
	userRepository           repositories2.UserRepository
	tokenService             *token_services.TokenService
	globalDeckRepository     repositories2.GlobalDeckRepository
}

func NewGlobalCardUseCases(
	db *pgxpool.Pool,
	GCRepo repositories2.GlobalCardRepository,
	DPRepo repositories2.DeckPermissionRepository,
	tokenService *token_services.TokenService,
	userRepository repositories2.UserRepository,
	globalDeckRepository repositories2.GlobalDeckRepository,
) *GlobalCardUseCases {
	return &GlobalCardUseCases{
		db:                       db,
		globalCardRepository:     GCRepo,
		deckPermissionRepository: DPRepo,
		tokenService:             tokenService,
		userRepository:           userRepository,
		globalDeckRepository:     globalDeckRepository,
	}
}
