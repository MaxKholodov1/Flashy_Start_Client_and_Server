package user_deck_progress_service_server

import (
	"go_server/application/services/token_services"
	"go_server/application/use_cases/user_deck_progress_use_cases"
	"go_server/infrastructure/grpc_infr/user_deck_progress"
)

type UserDeckProgressService struct {
	user_deck_progress.UnimplementedUserDeckProgressServiceServer
	userDeckProgressUseCases *user_deck_progress_use_cases.UserDeckProgressUseCases
	tokenService             *token_services.TokenService
}

func NewUserDeckProgressServiceServerServiceServer(
	useCases *user_deck_progress_use_cases.UserDeckProgressUseCases,
	tokenService *token_services.TokenService,
) *UserDeckProgressService {
	return &UserDeckProgressService{
		userDeckProgressUseCases: useCases,
		tokenService:             tokenService,
	}
}
