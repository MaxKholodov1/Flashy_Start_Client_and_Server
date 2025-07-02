package auth_service_server

import (
	"context"
	"go_server/application/use_cases"
	"go_server/infrastructure/grpc_infr/user/auth"
)

func (s *AuthServiceServer) RefreshToken(ctx context.Context, req *auth.RefreshTokenRequest) (*auth.RefreshTokenResponse, error) {
	refreshToken := req.GetRefreshToken()
	userID, err := s.tokenService.ParseRefreshToken(refreshToken)

	if err != nil {
		return nil, MapAuthErrToGrpcErr(use_cases.ErrRefreshTokenInvalid)
	}

	newAccessToken, err := s.tokenService.GenerateAccessToken(userID)
	if err != nil {
		return nil, MapAuthErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}

	newRefreshToken, err := s.tokenService.GenerateRefreshToken(userID)
	if err != nil {
		return nil, MapAuthErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}

	return &auth.RefreshTokenResponse{
		AccessToken:  newAccessToken,
		RefreshToken: newRefreshToken,
		UserID:       int32(userID),
	}, nil
}
