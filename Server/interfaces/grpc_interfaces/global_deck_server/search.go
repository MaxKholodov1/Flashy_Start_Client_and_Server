package global_deck_server

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/infrastructure/grpc_infr/global_deck"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (s *GlobalDeckServiceServer) SearchGlobalDecks(ctx context.Context, req *global_deck.SearchGlobalDecksRequest) (*global_deck.SearchGlobalDecksResponse, error) {
	accessToken, err := s.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}

	results, hasMore, err := s.globalDeckUseCases.SearchGlobalDecks(ctx, req.Query, accessToken, int(req.Limit), int(req.Offset))
	if err != nil {
		return nil, MapGlobalDeckErrToGrpcErr(err)
	}

	resp := &global_deck.SearchGlobalDecksResponse{
		HasMore: hasMore,
	}

	for _, r := range results {
		pbDeck := &global_deck.GlobalDeck{
			Id:          int32(r.Deck.ID),
			Title:       r.Deck.Title,
			Description: r.Deck.Description,
			IsPublic:    r.Deck.IsPublic,
			AuthorID:    int32(r.Deck.AuthorID),
			CreatedAt:   timestamppb.New(r.Deck.CreatedAt),
			UpdatedAt:   timestamppb.New(r.Deck.UpdatedAt),
			Tags:        r.Deck.Tags,
			Version:     int32(r.Deck.Version),
		}
		resp.Results = append(resp.Results, &global_deck.SearchResultDeck{
			Deck:           pbDeck,
			IsAlreadyAdded: r.IsAlreadyAdded,
		})
	}
	return resp, nil
}
