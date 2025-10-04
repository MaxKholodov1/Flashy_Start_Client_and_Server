package validation_service_server

import (
	"context"
	"go_server/Server/infrastructure/grpc_infr/user/validation"
)

func (s *ValidationServiceServer) CheckUserNameAvailability(ctx context.Context, req *validation.CheckUserNameAvailabilityRequest) (*validation.CheckUserNameAvailabilityResponse, error) {
	userName := req.GetUserName()

	isAvailable, err := s.userUseCases.CheckUserNameAvailability(ctx, userName)
	if err != nil {
		return nil, MapValidationErrToGrpcErr(err)
	}
	return &validation.CheckUserNameAvailabilityResponse{
		IsAvailable: isAvailable,
	}, nil
}

func (s *ValidationServiceServer) CheckUserEmailAvailability(ctx context.Context, req *validation.CheckUserEmailAvailabilityRequest) (*validation.CheckUserEmailAvailabilityResponse, error) {
	isAvailable, err := s.userUseCases.CheckUserEmailAvailability(ctx, req.GetUserEmail())
	if err != nil {
		return nil, MapValidationErrToGrpcErr(err)
	}
	return &validation.CheckUserEmailAvailabilityResponse{
		IsAvailable: isAvailable,
	}, nil
}
func (s *ValidationServiceServer) CheckPasswordValidity(ctx context.Context, req *validation.CheckUserPasswordAvailabilityRequest) (*validation.CheckUserPasswordAvailabilityResponse, error) {
	password := req.GetPassword()

	err := s.userUseCases.CheckPasswordValidity(ctx, password)
	if err != nil {
		return nil, MapValidationErrToGrpcErr(err)
	}

	return &validation.CheckUserPasswordAvailabilityResponse{
		IsValid: true,
	}, nil
}
