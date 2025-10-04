package user_server

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/infrastructure/grpc_infr/user/user"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (s *UserServiceServer) GetUser(ctx context.Context, req *user.GetUserRequest) (*user.GetUserResponse, error) {
	userID, err := s.tokenService.ParseAccessToken(req.AccessToken, ctx)
	if err != nil {
		return nil, MapUserErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}

	u, err := s.userUseCases.GetUserByID(ctx, userID)
	if err != nil {
		return nil, MapUserErrToGrpcErr(use_cases.ErrDBFailure((err)))
	}

	return &user.GetUserResponse{
		UserName:  u.UserName,
		Email:     u.Email,
		CreatedAt: timestamppb.New(*u.CreatedAt),
	}, nil
}
