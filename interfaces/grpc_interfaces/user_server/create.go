package user_server

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"go_server/infrastructure/grpc_infr/user/user"
	"log"
)

func (s *UserServiceServer) CreateUser(ctx context.Context, req *user.CreateUserRequest) (*user.CreateUserResponse, error) {
	entity := &entities.User{
		UserName:     req.UserName,
		Email:        req.Email,
		PasswordHash: req.Password,
	}
	log.Println("DEBUG: before create use cases") // ← это должно точно появиться
	log.Println(s.userUseCases)                   // ← это должно точно появиться
	log.Println("after print usecases")           // ← это должно точно появиться
	userID, err := s.userUseCases.CreateUser(ctx, entity)
	if err != nil {
		return &user.CreateUserResponse{
			IsSuccess: false,
		}, MapUserErrToGrpcErr(err)
	}
	accessToken, err := s.tokenService.GenerateAccessToken(userID)
	if err != nil {
		return &user.CreateUserResponse{
			IsSuccess: false,
		}, MapUserErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}
	refreshToken, err := s.tokenService.GenerateRefreshToken(userID)
	if err != nil {
		return &user.CreateUserResponse{
			IsSuccess: false,
		}, MapUserErrToGrpcErr(use_cases.ErrFailedToGenerateToken)
	}
	return &user.CreateUserResponse{
		IsSuccess:    true,
		AccessToken:  accessToken,
		RefreshToken: refreshToken,
		UserID:       int32(userID),
	}, nil
}
