package global_deck_server

import (
	"context"
	"go_server/application/use_cases"
	"go_server/infrastructure/grpc_infr/global_deck"
)

func (s *GlobalDeckServiceServer) AddDeckToLearningDecks(ctx context.Context, req *global_deck.AddDeckToLearningDecksRequest) (*global_deck.AddDeckToLearningDecksResponse, error) {
	accessToken, err := s.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}
	_, err = s.globalDeckUseCases.AddDeckToLearningDecks(ctx, accessToken, int(req.DeckID))
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}
	return &global_deck.AddDeckToLearningDecksResponse{IsSuccess: true}, nil
}
