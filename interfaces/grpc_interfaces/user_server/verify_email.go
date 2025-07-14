package user_server

import (
	"context"
	"go_server/application/use_cases"
	"go_server/infrastructure/grpc_infr/user/user"
)

func (s *UserServiceServer) VerifyEmail(ctx context.Context, req *user.VerifyEmailRequest) (*user.VerifyEmailResponse, error) {
	isSuccess, err := s.userUseCases.VerifyEmail(ctx, req.Code, int(req.UserId))
	if err != nil {
		return nil, MapUserErrToGrpcErr(err)
	}
	if !isSuccess {
		return &user.VerifyEmailResponse{
			IsSuccess: isSuccess,
		}, nil
	}
	refreshToken, err := s.tokenService.GenerateRefreshToken(int(req.UserId), ctx)
	if err != nil {
		return nil, MapUserErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}
	accessToken, err := s.tokenService.GenerateAccessToken(int(req.UserId), ctx)
	if err != nil {
		return nil, MapUserErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}

	return &user.VerifyEmailResponse{
		IsSuccess:    isSuccess,
		RefreshToken: refreshToken,
		AccessToken:  accessToken,
	}, nil
}
