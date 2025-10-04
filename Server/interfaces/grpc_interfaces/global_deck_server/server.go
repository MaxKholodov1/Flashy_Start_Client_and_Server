package global_deck_server

import (
	"go_server/Server/application/services/token_services"
	"go_server/Server/application/use_cases/global_deck_use_cases"
	"go_server/Server/infrastructure/grpc_infr/global_deck"
)

type GlobalDeckServiceServer struct {
	global_deck.UnimplementedGlobalDeckServiceServer
	globalDeckUseCases *global_deck_use_cases.GlobalDeckUseCases
	tokenService       *token_services.TokenService
}

func NewGlobalDeckServiceServer(us *global_deck_use_cases.GlobalDeckUseCases, ts *token_services.TokenService) *GlobalDeckServiceServer {
	return &GlobalDeckServiceServer{globalDeckUseCases: us, tokenService: ts}
}
