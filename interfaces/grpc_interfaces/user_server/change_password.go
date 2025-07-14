package user_server

import (
	"context"
	"go_server/infrastructure/grpc_infr/user/user"
)

func (s *UserServiceServer) ChangePassword(ctx context.Context, req *user.ChangePasswordRequest) (*user.ChangePasswordResponse, error) {
	isSuccess, refreshToken, accessToken, err := s.userUseCases.ChangePassword(ctx, req.Password, req.NewPassword)
	if err != nil {
		return nil, MapUserErrToGrpcErr(err)
	}
	return &user.ChangePasswordResponse{
		IsSuccess:    isSuccess,
		RefreshToken: refreshToken,
		AccessToken:  accessToken,
	}, nil
}
