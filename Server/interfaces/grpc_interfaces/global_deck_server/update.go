package global_deck_server

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/entities"
	"go_server/Server/infrastructure/grpc_infr/global_deck"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (s *GlobalDeckServiceServer) UpdateGlobalDeck(ctx context.Context, req *global_deck.UpdateGlobalDeckRequest) (*global_deck.UpdateGlobalDeckResponse, error) {
	accessToken, err := s.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}
	protoGlobalDeck := req.GlobalDeck
	globalDeck := entities.GlobalDeck{
		Title:       protoGlobalDeck.Title,
		Description: protoGlobalDeck.Description,
		IsPublic:    protoGlobalDeck.IsPublic,
		UpdatedAt:   protoGlobalDeck.UpdatedAt.AsTime(),
		CreatedAt:   protoGlobalDeck.CreatedAt.AsTime(),
		Tags:        protoGlobalDeck.Tags,
		ID:          int(int32(protoGlobalDeck.Id)),
		AuthorID:    int(protoGlobalDeck.AuthorID),
		Version:     int(protoGlobalDeck.Version),
	}

	conflictDeck, isSuccess, err := s.globalDeckUseCases.UpdateGlobalDeck(ctx, globalDeck, accessToken)

	if isSuccess == nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}
	if *isSuccess == true {
		return &global_deck.UpdateGlobalDeckResponse{
			ConflictDeck: nil,
			IsSuccess:    *isSuccess,
		}, nil
	}
	return &global_deck.UpdateGlobalDeckResponse{
		ConflictDeck: &global_deck.GlobalDeck{
			Id:          int32(conflictDeck.ID),
			Title:       conflictDeck.Title,
			Description: conflictDeck.Description,
			IsPublic:    conflictDeck.IsPublic,
			AuthorID:    int32(conflictDeck.AuthorID),
			UpdatedAt:   timestamppb.New(conflictDeck.UpdatedAt),
			CreatedAt:   timestamppb.New(conflictDeck.CreatedAt),
			Tags:        conflictDeck.Tags,
			Version:     int32(conflictDeck.Version),
		},
		IsSuccess: *isSuccess,
	}, nil
}
