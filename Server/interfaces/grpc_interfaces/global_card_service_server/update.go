package global_card_service_server

import (
	"context"
	"go_server/Server/infrastructure/grpc_infr/global_card"
)

func (s *GlobalCardServiceServer) UpdateGlobalCard(ctx context.Context, req *global_card.UpdateGlobalCardRequest) (*global_card.UpdateGlobalCardResponse, error) {
	conflictCard, isSuccess, err := s.globalCardUseCases.UpdateGlobalCard(ctx, int(req.CardID), int(req.Version), req.Question, req.Answer)
	if err != nil {
		return nil, MapGlobalCardErrToGrpcErr(err)
	}
	if *isSuccess {
		return &global_card.UpdateGlobalCardResponse{
			IsSuccess: true,
		}, nil
	}
	return &global_card.UpdateGlobalCardResponse{
		IsSuccess:    false,
		ConflictCard: MapGlobalCardToProto(conflictCard),
	}, nil
}
