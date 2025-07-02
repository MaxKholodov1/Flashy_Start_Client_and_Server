package global_card_service_server

import (
	"context"
	"go_server/application/use_cases"
	"go_server/infrastructure/grpc_infr/global_card"
)

func (s *GlobalCardServiceServer) DeleteGlobalCard(ctx context.Context, req *global_card.DeleteGlobalCardRequest) (*global_card.DeleteGlobalCardResponse, error) {
	accessToken, err := s.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, MapGlobalCardErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}
	_, err = s.globalCardUseCases.DeleteCard(ctx, int(req.CardId), accessToken)
	if err != nil {
		return nil, MapGlobalCardErrToGrpcErr(err)
	}
	return &global_card.DeleteGlobalCardResponse{
		IsSuccess: true,
	}, nil
}
