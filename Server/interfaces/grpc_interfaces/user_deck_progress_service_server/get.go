package user_deck_progress_service_server

import (
	"context"
	"go_server/Server/application/use_cases"
	"go_server/Server/infrastructure/grpc_infr/user_deck_progress"
)

func (s *UserDeckProgressService) GetUserLearningProgressDecks(ctx context.Context, req *user_deck_progress.GetUserLearningProgressDecksRequest) (*user_deck_progress.GetUserLearningProgressDecksResponse, error) {
	accessToken, err := s.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, MapUserDeckProgressErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}
	userID, err := s.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		return nil, MapUserDeckProgressErrToGrpcErr(use_cases.ErrAccessTokenInvalid)
	}
	userDeckProgressList, err := s.userDeckProgressUseCases.GetUserLearningProgressDecks(ctx, userID)
	if err != nil {
		return nil, MapUserDeckProgressErrToGrpcErr(err)
	}
	//slices.Reverse(userDeckProgressList)
	var pbUserDeckProgressList []*user_deck_progress.UserDeckProgress
	pbUserDeckProgressList = ConvertUserDeckProgressListToProto(userDeckProgressList)
	return &user_deck_progress.GetUserLearningProgressDecksResponse{
		UserDeckProgressList: pbUserDeckProgressList,
	}, nil
}
func (s *UserDeckProgressService) SelectDecksForTodayReview(ctx context.Context, req *user_deck_progress.UserProgressDecks) (*user_deck_progress.UserProgressDecks, error) {

	userDeckProgressList, err := s.userDeckProgressUseCases.SelectDecksForTodayReview(ctx, ConvertProtoToUserDeckProgressList(req.UserProgressDecks))
	if err != nil {
		return nil, MapUserDeckProgressErrToGrpcErr(err)
	}
	var pbUserDeckProgressList []*user_deck_progress.UserDeckProgress
	pbUserDeckProgressList = ConvertUserDeckProgressListToProto(userDeckProgressList)
	return &user_deck_progress.UserProgressDecks{
		UserProgressDecks: pbUserDeckProgressList,
	}, nil
}
