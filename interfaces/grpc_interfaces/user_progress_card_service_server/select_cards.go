package user_progress_card_service_server

import (
	"context"
	"go_server/infrastructure/grpc_infr/user_progress_card"
)

func (s *UserProgressCardServiceServer) SelectNewProgressCards(ctx context.Context, req *user_progress_card.ProgressCards) (*user_progress_card.ProgressCards, error) {
	progressCards, err := s.userProgressCardUseCases.SelectNewProgressCards(ctx, MapProtoToUserProgressCards(req.Cards))
	if err != nil {
		return nil, MapProgressCardErrToGrpcErr(err)
	}
	return &user_progress_card.ProgressCards{Cards: MapUserProgressCardsToProto(progressCards)}, nil
}
func (s *UserProgressCardServiceServer) SelectFamiliarProgressCards(ctx context.Context, req *user_progress_card.ProgressCards) (*user_progress_card.ProgressCards, error) {
	progressCards, err := s.userProgressCardUseCases.SelectFamiliarProgressCards(ctx, MapProtoToUserProgressCards(req.Cards))
	if err != nil {
		return nil, MapProgressCardErrToGrpcErr(err)
	}
	return &user_progress_card.ProgressCards{Cards: MapUserProgressCardsToProto(progressCards)}, nil
}
