package user_progress_card_service_server

import (
	"context"
	"go_server/Server/infrastructure/grpc_infr/user_progress_card"
)

func (s *UserProgressCardServiceServer) SubmitProgressCardReview(ctx context.Context, req *user_progress_card.CardReviewRequest) (*user_progress_card.CardReviewResponse, error) {
	progressCards, err := s.userProgressCardUseCases.SubmitProgressCardReview(ctx, MapProtoRecallQualityToDomain(req.Quality), MapProtoToUserProgressCards(req.Cards))
	if err != nil {
		return nil, MapProgressCardErrToGrpcErr(err)
	}
	return &user_progress_card.CardReviewResponse{Cards: MapUserProgressCardsToProto(progressCards)}, nil
}
