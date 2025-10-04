package user_server

import (
	"go_server/Server/application/services/token_services"
	"go_server/Server/application/use_cases/user_use_cases"
	"go_server/Server/infrastructure/grpc_infr/user/user"
)

type UserServiceServer struct {
	user.UnimplementedUserServiceServer
	userUseCases *user_use_cases.UserUseCases
	tokenService *token_services.TokenService
}

func NewUserServiceServer(
	us *user_use_cases.UserUseCases,
	ts *token_services.TokenService,
) *UserServiceServer {
	return &UserServiceServer{
		userUseCases: us,
		tokenService: ts,
	}
}
