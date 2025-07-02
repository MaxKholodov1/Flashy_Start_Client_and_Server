package global_card_service_server

import (
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"go_server/infrastructure/grpc_infr/global_card"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func MapGlobalCardErrToGrpcErr(err error) error {
	switch err {
	case use_cases.ErrAccessTokenInvalid:
		return status.Error(codes.Unauthenticated, err.Error())
	case use_cases.ErrDeckPermissionDenied:
		return status.Error(codes.PermissionDenied, err.Error())
	case use_cases.ErrInvalidQuestionOfTheCard:
		return status.Error(codes.InvalidArgument, err.Error())
	case use_cases.ErrInvalidAnswerOfTheCard:
		return status.Error(codes.InvalidArgument, err.Error())
	case use_cases.ErrGlobalCardNotFound:
		return status.Error(codes.NotFound, err.Error())
	default:
		return status.Error(codes.Internal, "unexpected error: "+err.Error())
	}
}
func MapListOfCardsToProto(cards []*entities.GlobalCard) []*global_card.GlobalCard {
	result := make([]*global_card.GlobalCard, 0, len(cards))
	for _, card := range cards {
		result = append(result, &global_card.GlobalCard{
			Id:        int32(card.ID),
			DeckID:    int32(card.DeckID),
			Question:  card.Question,
			Answer:    card.Answer,
			AuthorID:  int32(card.AuthorID),
			CreatedAt: timestamppb.New(card.CreatedAt),
			UpdatedAt: timestamppb.New(card.UpdatedAt),
			Version:   int32(card.Version),
		})
	}
	return result
}
func MapGlobalCardToProto(card *entities.GlobalCard) *global_card.GlobalCard {
	return &global_card.GlobalCard{
		Id:        int32(card.ID),
		DeckID:    int32(card.DeckID),
		Question:  card.Question,
		Answer:    card.Answer,
		AuthorID:  int32(card.AuthorID),
		CreatedAt: timestamppb.New(card.CreatedAt),
		UpdatedAt: timestamppb.New(card.UpdatedAt),
		Version:   int32(card.Version),
	}
}
