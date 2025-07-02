package global_card_service_server

import (
	"context"
	"go_server/application/use_cases"
	"go_server/infrastructure/grpc_infr/global_card"
)

func (s *GlobalCardServiceServer) CreateGlobalCard(ctx context.Context, req *global_card.CreateGlobalCardRequest) (*global_card.CreateGlobalCardResponse, error) {
	accessToken, err := s.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, MapGlobalCardErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}
	id, err := s.globalCardUseCases.CreateCard(ctx, req.Question, req.Answer, int(req.DeckID), accessToken)
	if err != nil {
		return nil, MapGlobalCardErrToGrpcErr(err)
	}
	return &global_card.CreateGlobalCardResponse{
		Id: int32(id),
	}, nil
}
