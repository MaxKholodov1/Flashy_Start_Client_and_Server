package auth_service_server

import (
	"go_server/Server/application/services/token_services"
	"go_server/Server/application/use_cases/user_use_cases"
	"go_server/Server/infrastructure/grpc_infr/user/auth"
)

type AuthServiceServer struct {
	auth.UnimplementedAuthServiceServer
	userUseCases *user_use_cases.UserUseCases
	tokenService *token_services.TokenService
}

func NewAuthServiceServer(us *user_use_cases.UserUseCases, ts *token_services.TokenService) *AuthServiceServer {
	return &AuthServiceServer{userUseCases: us, tokenService: ts}
}
