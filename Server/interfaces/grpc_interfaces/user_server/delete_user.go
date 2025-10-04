package user_server

import (
	"context"
	"go_server/Server/infrastructure/grpc_infr/user/user"
)

func (s *UserServiceServer) DeleteUser(ctx context.Context, req *user.DeleteUserRequest) (*user.DeleteUserResponse, error) {
	isSuccess, err := s.userUseCases.DeleteUser(ctx)
	if err != nil {
		return nil, MapUserErrToGrpcErr(err)
	}
	return &user.DeleteUserResponse{IsSuccess: isSuccess}, nil
}
