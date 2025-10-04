package global_deck_server

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/infrastructure/grpc_infr/global_deck"
)

func (s *GlobalDeckServiceServer) DeleteGlobalDeck(ctx context.Context, req *global_deck.DeleteGlobalDeckRequest) (*global_deck.DeleteGlobalDeckResponse, error) {
	accessToken, err := s.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}
	isSuccess, err := s.globalDeckUseCases.DeleteGlobalDeck(ctx, accessToken, int(req.DeckID))
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}
	return &global_deck.DeleteGlobalDeckResponse{IsSuccess: isSuccess}, nil
}
