package global_card_use_cases

import (
	"github.com/jackc/pgx/v5/pgxpool"
	"go_server/application/services/token_services"
	"go_server/domain/repositories"
)

type GlobalCardUseCases struct {
	db                       *pgxpool.Pool
	globalCardRepository     repositories.GlobalCardRepository
	deckPermissionRepository repositories.DeckPermissionRepository
	userRepository           repositories.UserRepository
	tokenService             *token_services.TokenService
	globalDeckRepository     repositories.GlobalDeckRepository
}

func NewGlobalCardUseCases(
	db *pgxpool.Pool,
	GCRepo repositories.GlobalCardRepository,
	DPRepo repositories.DeckPermissionRepository,
	tokenService *token_services.TokenService,
	userRepository repositories.UserRepository,
	globalDeckRepository repositories.GlobalDeckRepository,
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
