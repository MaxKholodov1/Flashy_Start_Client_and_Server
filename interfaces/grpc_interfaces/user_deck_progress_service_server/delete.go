package user_deck_progress_service_server

import (
	"context"
	"go_server/infrastructure/grpc_infr/user_deck_progress"
)

func (s *UserDeckProgressService) DeleteDeckFromLearningDecks(ctx context.Context, req *user_deck_progress.DeleteDeckFromLearningDecksRequest) (*user_deck_progress.DeleteDeckFromLearningDecksResponse, error) {

	_, err := s.userDeckProgressUseCases.DeleteDeckFromLearningDecks(ctx, int(req.DeckId))
	if err != nil {
		return nil, MapUserDeckProgressErrToGrpcErr(err)
	}

	return &user_deck_progress.DeleteDeckFromLearningDecksResponse{
		IsSuccess: true,
	}, nil
}
