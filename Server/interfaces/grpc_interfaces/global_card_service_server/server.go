package global_card_service_server

import (
	"go_server/Server/application/services/token_services"
	"go_server/Server/application/use_cases/global_card_use_cases"
	"go_server/Server/infrastructure/grpc_infr/global_card"
)

type GlobalCardServiceServer struct {
	global_card.UnimplementedGlobalCardServiceServer
	globalCardUseCases *global_card_use_cases.GlobalCardUseCases
	tokenService       *token_services.TokenService
}

func NewGlobalCardServiceServer(ts *token_services.TokenService, GCuc *global_card_use_cases.GlobalCardUseCases) *GlobalCardServiceServer {
	return &GlobalCardServiceServer{tokenService: ts, globalCardUseCases: GCuc}
}
