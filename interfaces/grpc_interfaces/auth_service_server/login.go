package auth_service_server

import (
	"context"
	"go_server/application/use_cases"
	"go_server/infrastructure/grpc_infr/user/auth"
)

func (s *AuthServiceServer) Login(ctx context.Context, req *auth.LoginRequest) (*auth.LoginResponse, error) {
	userr, isCorrect, isVerified, err := s.userUseCases.Login(ctx, req.Identifier, req.Password)
	if err != nil {
		return nil, MapAuthErrToGrpcErr(err)
	} // эта штука возвращает либо isCorrect - true либо err
	if !isVerified {
		return &auth.LoginResponse{
			IsVerified: isVerified,
			UserID:     userr.ID,
		}, nil
	}
	accessToken, err := s.tokenService.GenerateAccessToken(int(userr.ID))
	if err != nil {
		return nil, MapAuthErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}
	refreshToken, err := s.tokenService.GenerateRefreshToken(int(userr.ID))
	if err != nil {
		return nil, MapAuthErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}
	return &auth.LoginResponse{
		IsPasswordCorrect: isCorrect,
		AccessToken:       accessToken,
		RefreshToken:      refreshToken,
		IsVerified:        isVerified,
		UserID:            userr.ID,
	}, nil
}
