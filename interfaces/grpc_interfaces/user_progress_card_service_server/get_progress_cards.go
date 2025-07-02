package user_progress_card_service_server

import (
	"context"
	"go_server/infrastructure/grpc_infr/user_progress_card"
)

func (s *UserProgressCardServiceServer) GetProgressCardsByDeckID(ctx context.Context, req *user_progress_card.GetProgressCardsByDeckIDRequest) (*user_progress_card.GetProgressCardsByDeckIDResponse, error) {
	progressCards, err := s.userProgressCardUseCases.GetProgressCardsByDeckID(ctx, int(req.DeckID))
	if err != nil {
		return nil, MapProgressCardErrToGrpcErr(err)
	}
	return MapUserProgressCardsToProtoGetResponse(progressCards), nil
}
func (s *UserProgressCardServiceServer) GetCardsForTodayReview(ctx context.Context, req *user_progress_card.GetCardsForTodayReviewRequest) (*user_progress_card.ProgressCards, error) {
	progressCards, err := s.userProgressCardUseCases.GetCardsForTodayReview(ctx, int(req.DeckId))
	if err != nil {
		return nil, MapProgressCardErrToGrpcErr(err)
	}
	return &user_progress_card.ProgressCards{Cards: MapUserProgressCardsToProto(progressCards)}, nil
}
