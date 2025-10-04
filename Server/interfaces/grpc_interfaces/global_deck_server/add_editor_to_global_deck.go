package global_deck_server

import (
	"context"
	"go_server/Server/infrastructure/grpc_infr/global_deck"
)

func (s *GlobalDeckServiceServer) AddEditorToGlobalDeck(ctx context.Context, req *global_deck.AddEditorToGlobalDeckRequest) (*global_deck.AddEditorToGlobalDeckResponse, error) {
	_, err := s.globalDeckUseCases.AddEditorToGlobalDeck(ctx, int(req.Deck_ID), req.UserName)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}
	return &global_deck.AddEditorToGlobalDeckResponse{IsSuccess: true}, nil
}
