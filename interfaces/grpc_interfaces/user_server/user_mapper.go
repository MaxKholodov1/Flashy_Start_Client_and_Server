package user_server

import (
	"go_server/application/use_cases"
	"go_server/domain/validation"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func MapUserErrToGrpcErr(err error) error {
	switch err {
	case validation.ErrUsernameLength,
		validation.ErrUsernameStart,
		validation.ErrUsernameEnd,
		validation.ErrUsernameCharset:
		return status.Error(codes.InvalidArgument, err.Error())
	case use_cases.ErrUsernameTaken:
		{
			return status.Error(codes.AlreadyExists, err.Error())
		}
	case validation.ErrInvalidEmailFormat:
		return status.Error(codes.InvalidArgument, err.Error())

	case use_cases.ErrEmailTaken:
		return status.Error(codes.AlreadyExists, err.Error())

	case validation.ErrPasswordPolicy,
		validation.ErrPasswordLength:
		return status.Error(codes.InvalidArgument, err.Error())

	case use_cases.ErrDBFailure:
		return status.Error(codes.Internal, err.Error())
	case use_cases.ErrFailedToGeneratePasswordHash:
		return status.Error(codes.Internal, err.Error())
	case use_cases.ErrAccessTokenInvalid:
		return status.Error(codes.Unauthenticated, err.Error())
	default:
		return status.Error(codes.Internal, "unexpected error: "+err.Error())
	}
}
