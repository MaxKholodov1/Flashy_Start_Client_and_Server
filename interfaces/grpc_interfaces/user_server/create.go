package user_server

import (
	"context"
	"go_server/domain/entities"
	"go_server/infrastructure/grpc_infr/user/user"
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
