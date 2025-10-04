package user_server

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/entities"
	"go_server/Server/infrastructure/grpc_infr/user/user"
)

func (s *UserServiceServer) CreateUser(ctx context.Context, req *user.CreateUserRequest) (*user.CreateUserResponse, error) {
	entity := &entities.User{
		UserName:     req.UserName,
		Email:        req.Email,
		PasswordHash: req.Password,
	}
	userID, err := s.userUseCases.CreateUser(ctx, entity)
	if err != nil {
		return &user.CreateUserResponse{
			IsSuccess: false,
		}, MapUserErrToGrpcErr(err)
	}
	return &user.CreateUserResponse{
		IsSuccess: true,
		UserID:    int32(userID),
	}, nil
}
func (s *UserServiceServer) CreateDefUser(ctx context.Context, req *user.CreateDefUserRequest) (*user.CreateDefUserResponse, error) {
	userID, err := s.userUseCases.CreateDefUser(ctx)
	if err != nil {
		return &user.CreateDefUserResponse{
			IsSuccess: false,
		}, MapUserErrToGrpcErr(err)
	}
	refreshToken, err := s.tokenService.GenerateRefreshToken(userID, ctx)
	if err != nil {
		return nil, MapUserErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}
	accessToken, err := s.tokenService.GenerateAccessToken(userID, ctx)
	if err != nil {
		return nil, MapUserErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}
	return &user.CreateDefUserResponse{
		IsSuccess:    true,
		UserID:       int32(userID),
		RefreshToken: refreshToken,
		AccessToken:  accessToken,
	}, nil
}
