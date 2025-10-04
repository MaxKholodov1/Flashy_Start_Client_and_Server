package validation_service_server

import (
	"go_server/Server/application/use_cases/user_use_cases"
	"go_server/Server/infrastructure/grpc_infr/user/validation"
)

type ValidationServiceServer struct {
	validation.UnimplementedValidationServiceServer
	userUseCases *user_use_cases.UserUseCases
}

func NewValidationServiceServer(us *user_use_cases.UserUseCases) *ValidationServiceServer {
	return &ValidationServiceServer{userUseCases: us}
}
