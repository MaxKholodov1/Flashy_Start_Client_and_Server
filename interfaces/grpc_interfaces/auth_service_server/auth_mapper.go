package auth_service_server

import (
	"go_server/application/use_cases"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func MapAuthErrToGrpcErr(err error) error {
	switch err {
	case use_cases.ErrFailedToGenerateToken:
		return status.Error(codes.Internal, err.Error())
	case use_cases.ErrRefreshTokenInvalid:
		return status.Error(codes.Unauthenticated, err.Error())
	case use_cases.ErrUserNotFound:
		return status.Error(codes.NotFound, err.Error())
	case use_cases.ErrIncorrectPassword:
		return status.Error(codes.Unauthenticated, err.Error())
	default:
		return status.Error(codes.Internal, "unexpected error: "+err.Error())
	}
}
