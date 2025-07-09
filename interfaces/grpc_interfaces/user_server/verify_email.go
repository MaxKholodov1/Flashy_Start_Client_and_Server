package user_server

import (
	"context"
	"go_server/infrastructure/grpc_infr/user/user"
)

func (s *UserServiceServer) VerifyEmail(ctx context.Context, req *user.VerifyEmailRequest) (*user.VerifyEmailResponse, error) {
	isSuccess, err := s.userUseCases.VerifyEmail(ctx, req.Code, int(req.UserId))
	if err != nil {
		return &user.VerifyEmailResponse{
			IsSuccess: false,
		}, err
	}
	refreshToken, err := s.tokenService.GenerateRefreshToken(int(req.UserId))
	if err != nil {
		return &user.VerifyEmailResponse{
			IsSuccess: false,
		}, err
	}
	accessToken, err := s.tokenService.GenerateAccessToken(int(req.UserId))
	if err != nil {
		return &user.VerifyEmailResponse{
			IsSuccess: false,
		}, err
	}

	return &user.VerifyEmailResponse{
		IsSuccess:    isSuccess,
		RefreshToken: refreshToken,
		AccessToken:  accessToken,
	}, nil
}
