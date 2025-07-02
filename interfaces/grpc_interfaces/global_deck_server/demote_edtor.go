package global_deck_server

import (
	"context"
	"go_server/infrastructure/grpc_infr/global_deck"
)

func (s *GlobalDeckServiceServer) DemoteEditorToLearner(ctx context.Context, req *global_deck.DemoteEditorToLearnerRequest) (*global_deck.DemoteEditorToLearnerResponse, error) {
	_, err := s.globalDeckUseCases.DemoteEditorToLearner(ctx, int(req.Deck_ID), req.UserName)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}
	return &global_deck.DemoteEditorToLearnerResponse{IsSuccess: true}, nil
}
