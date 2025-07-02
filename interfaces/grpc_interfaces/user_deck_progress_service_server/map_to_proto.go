package user_deck_progress_service_server

import (
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"go_server/infrastructure/grpc_infr/user_deck_progress"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
	"time"
)

func MapUserDeckProgressErrToGrpcErr(err error) error {
	switch err {
	case use_cases.ErrDBFailure:
		return status.Error(codes.Internal, err.Error())
	case use_cases.ErrAccessTokenInvalid:
		return status.Error(codes.Unauthenticated, err.Error())
	case use_cases.ErrGlobalCardNotFound:
		return status.Error(codes.NotFound, err.Error())
	case use_cases.ErrAuthorCantDeleteProgressDeck:
		return status.Error(codes.PermissionDenied, err.Error())
	default:
		return status.Error(codes.Internal, "unexpected error: "+err.Error())
	}
}
func ConvertUserDeckProgressListToProto(userDeckProgressList []*entities.UserDeckProgress) []*user_deck_progress.UserDeckProgress {
	var pbUserDeckProgressList []*user_deck_progress.UserDeckProgress

	for _, dp := range userDeckProgressList {
		var lastReviewedAt *timestamppb.Timestamp
		if !dp.LastReviewedAt.IsZero() {
			lastReviewedAt = timestamppb.New(dp.LastReviewedAt)
		}

		pb := &user_deck_progress.UserDeckProgress{
			UserId:         int32(dp.UserID),
			DeckId:         int32(dp.DeckID),
			Title:          dp.Title,
			Description:    dp.Description,
			LastReviewedAt: lastReviewedAt,
			Score:          int32(dp.Score),
		}

		pbUserDeckProgressList = append(pbUserDeckProgressList, pb)
	}

	return pbUserDeckProgressList
}
func ConvertProtoToUserDeckProgressList(pbList []*user_deck_progress.UserDeckProgress) []*entities.UserDeckProgress {
	var userDeckProgressList []*entities.UserDeckProgress

	for _, pb := range pbList {
		var lastReviewedAt time.Time
		if pb.LastReviewedAt != nil {
			lastReviewedAt = pb.LastReviewedAt.AsTime()
		}

		dp := &entities.UserDeckProgress{
			UserID:         int(pb.UserId),
			DeckID:         int(pb.DeckId),
			Title:          pb.Title,
			Description:    pb.Description,
			LastReviewedAt: lastReviewedAt,
			Score:          int(pb.Score),
		}

		userDeckProgressList = append(userDeckProgressList, dp)
	}

	return userDeckProgressList
}
