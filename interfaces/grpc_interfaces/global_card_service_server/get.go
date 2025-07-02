package global_card_service_server

import (
	"context"
	"go_server/infrastructure/grpc_infr/global_card"
)

func (s *GlobalCardServiceServer) GetGlobalCardsByDeckID(ctx context.Context, req *global_card.GetGlobalCardsByDeckIDRequest) (*global_card.GetGlobalCardsByDeckIDResponse, error) {
	globalCards, err := s.globalCardUseCases.GetGlobalCardsByDeckID(ctx, int(req.DeckID))
	if err != nil {
		return nil, MapGlobalCardErrToGrpcErr(err)
	}
	return &global_card.GetGlobalCardsByDeckIDResponse{
		GlobalCards: MapListOfCardsToProto(globalCards),
	}, nil
}
