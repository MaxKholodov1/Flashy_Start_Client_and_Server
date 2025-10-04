package global_deck_server

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/infrastructure/grpc_infr/global_deck"
)

func (s *GlobalDeckServiceServer) CreateGlobalDeck(ctx context.Context, req *global_deck.CreateGlobalDeckRequest) (*global_deck.CreateGlobalDeckResponse, error) {
	accessToken, err := s.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}
	id, err := s.globalDeckUseCases.CreateDeckWithPermission(ctx, req.Title, &req.Description, accessToken, req.IsPublic)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}
	return &global_deck.CreateGlobalDeckResponse{
		Id: int32(id),
	}, nil
}
