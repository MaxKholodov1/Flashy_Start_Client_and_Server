package user_server

import (
	"context"
	"go_server/Server/infrastructure/grpc_infr/user/user"
)

func (s *UserServiceServer) PasswordRecovery(ctx context.Context, req *user.PasswordRecoveryRequest) (*user.PasswordRecoveryResponse, error) {
	isSuccess, err := s.userUseCases.PasswordRecovery(ctx, req.UsernameOrEmail)
	if err != nil {
		return nil, MapUserErrToGrpcErr(err)
	}
	return &user.PasswordRecoveryResponse{
		IsSuccess: isSuccess,
	}, nil
}
