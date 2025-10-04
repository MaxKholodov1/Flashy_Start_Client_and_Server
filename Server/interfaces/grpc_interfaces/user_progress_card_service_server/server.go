package user_progress_card_service_server

import (
	"go_server/Server/application/services/token_services"
	"go_server/Server/application/use_cases/user_progress_card_use_cases"
	"go_server/Server/infrastructure/grpc_infr/user_progress_card"
)

type UserProgressCardServiceServer struct {
	user_progress_card.UnimplementedUserProgressCardServiceServer
	userProgressCardUseCases *user_progress_card_use_cases.UserProgressCardUseCases
	tokenService             *token_services.TokenService
}

func NewUserProgressCardServiceServer(
	useCases *user_progress_card_use_cases.UserProgressCardUseCases,
	tokenService *token_services.TokenService,
) *UserProgressCardServiceServer {
	return &UserProgressCardServiceServer{
		userProgressCardUseCases: useCases,
		tokenService:             tokenService,
	}
}
