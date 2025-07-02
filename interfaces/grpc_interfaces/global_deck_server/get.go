package global_deck_server

import (
	"context"
	"go_server/infrastructure/grpc_infr/global_deck"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (s *GlobalDeckServiceServer) GetEditableGlobalDecks(ctx context.Context, req *global_deck.GetEditableDecksRequest) (*global_deck.GetEditableDecksResponse, error) {
	listOfEditableGlobalDecks, err := s.globalDeckUseCases.GetEditableGlobalDecks(ctx)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}
	return &global_deck.GetEditableDecksResponse{
		ListOfGlobalDecks: MapListOfDecks(listOfEditableGlobalDecks),
	}, nil
}

func (s *GlobalDeckServiceServer) GetGlobalDeckInfoByID(ctx context.Context, req *global_deck.GetGlobalDeckInfoByIDRequest) (*global_deck.GetGlobalDeckInfoByIDResponse, error) {
	globalDeck, authorName, editorNames, err := s.globalDeckUseCases.GetGlobalDeckInfoByID(ctx, int(req.Id))
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}

	return &global_deck.GetGlobalDeckInfoByIDResponse{
		GlobalDeck: &global_deck.GlobalDeck{
			Id:          int32(globalDeck.ID),
			Title:       globalDeck.Title,
			Description: globalDeck.Description,
			IsPublic:    globalDeck.IsPublic,
			AuthorID:    int32(globalDeck.AuthorID),
			UpdatedAt:   timestamppb.New(globalDeck.UpdatedAt),
			CreatedAt:   timestamppb.New(globalDeck.CreatedAt),
			Tags:        globalDeck.Tags,
			Version:     int32(globalDeck.Version),
		},
		AuthName:    *authorName,
		EditorNames: editorNames,
	}, nil
}
