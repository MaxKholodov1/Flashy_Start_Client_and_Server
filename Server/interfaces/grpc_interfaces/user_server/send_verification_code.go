package user_server

import (
	"context"
	"go_server/Server/infrastructure/grpc_infr/user/user"
)

func (s *UserServiceServer) SendVerificationCode(ctx context.Context, req *user.SendVerificationCodeRequest) (*user.SendVerificationCodeResponse, error) {
	isSuccess, err := s.userUseCases.SendVerificationCode(ctx, int(req.UserId))
	if err != nil {
		return nil, err
	}
	return &user.SendVerificationCodeResponse{
		IsSuccess: isSuccess,
	}, nil
}
