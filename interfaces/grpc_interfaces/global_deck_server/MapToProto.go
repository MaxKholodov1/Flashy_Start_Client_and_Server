package global_deck_server

import (
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"go_server/infrastructure/grpc_infr/global_deck"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func MapListOfDecks(decks []*entities.GlobalDeck) []*global_deck.GlobalDeck {
	result := make([]*global_deck.GlobalDeck, 0, len(decks))
	for _, deck := range decks {
		result = append(result, &global_deck.GlobalDeck{
			Id:          int32(deck.ID),
			Title:       deck.Title,
			Description: deck.Description,
			IsPublic:    deck.IsPublic,
			AuthorID:    int32(deck.AuthorID),
			CreatedAt:   timestamppb.New(deck.CreatedAt),
			UpdatedAt:   timestamppb.New(deck.UpdatedAt),
			Tags:        deck.Tags,
			Version:     int32(deck.Version),
		})
	}
	return result
}

func MapGlobalDeckErrToGrpcErr(err error) error {
	switch err {
	case use_cases.ErrSuchPermissionAlreadyExists:
		return status.Error(codes.AlreadyExists, err.Error())
	case use_cases.ErrUserNotFound:
		return status.Error(codes.NotFound, err.Error())
	case use_cases.ErrAccessTokenInvalid:
		return status.Error(codes.Unauthenticated, err.Error())
	case use_cases.ErrInvalidTitleOfGlobalDeck:
		return status.Error(codes.InvalidArgument, err.Error())
	case use_cases.ErrDeckPermissionDenied:
		return status.Error(codes.PermissionDenied, err.Error())
	default:
		return status.Error(codes.Internal, "unexpected error: "+err.Error())
	}
}
