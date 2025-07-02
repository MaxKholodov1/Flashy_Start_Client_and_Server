package auth_service_server

import (
	"go_server/application/services/token_services"
	"go_server/application/use_cases/user_use_cases"
	"go_server/infrastructure/grpc_infr/user/auth"
)

type AuthServiceServer struct {
	auth.UnimplementedAuthServiceServer
	userUseCases *user_use_cases.UserUseCases
	tokenService *token_services.TokenService
}

func NewAuthServiceServer(us *user_use_cases.UserUseCases, ts *token_services.TokenService) *AuthServiceServer {
	return &AuthServiceServer{userUseCases: us, tokenService: ts}
}
