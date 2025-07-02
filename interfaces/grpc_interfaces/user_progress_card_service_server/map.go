package user_progress_card_service_server

import (
	"go_server/application/use_cases"
	"go_server/domain"
	"go_server/domain/entities"
	"go_server/infrastructure/grpc_infr/user_progress_card"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
	"time"
)

func timestampToTimePtr(ts *timestamppb.Timestamp) *time.Time {
	if ts == nil || ts.AsTime().IsZero() {
		return nil
	}
	t := ts.AsTime()
	return &t
}
func MapProgressCardErrToGrpcErr(err error) error {
	switch err {
	case use_cases.ErrAccessTokenInvalid:
		return status.Error(codes.Unauthenticated, err.Error())
	case use_cases.ErrDeckPermissionDenied:
		return status.Error(codes.PermissionDenied, err.Error())
	default:
		return status.Error(codes.Internal, "unexpected error: "+err.Error())
	}
}
func ToDomainShortTermMemory(protoValue user_progress_card.ShortTermMemory) domain.ShortTermMemory {
	switch protoValue {
	case user_progress_card.ShortTermMemory_STM_BAD:
		return domain.STMBad
	case user_progress_card.ShortTermMemory_STM_NORMAL:
		return domain.STMNormal
	case user_progress_card.ShortTermMemory_STM_GOOD:
		return domain.STMGood
	case user_progress_card.ShortTermMemory_STM_PERFECT:
		return domain.STMPerfect
	default:
		return domain.STMUnknown
	}
}
func MapProtoRecallQualityToDomain(protoQuality user_progress_card.RecallQuality) domain.RecallQuality {
	switch protoQuality {
	case user_progress_card.RecallQuality_BAD:
		return domain.Bad
	case user_progress_card.RecallQuality_NORMAL:
		return domain.Normal
	case user_progress_card.RecallQuality_GOOD:
		return domain.Good
	case user_progress_card.RecallQuality_PERFECT:
		return domain.Perfect
	default:
		return domain.Perfect
	}
}
func ToProtoShortTermMemory(q domain.ShortTermMemory) user_progress_card.ShortTermMemory {
	switch q {
	case domain.STMBad:
		return user_progress_card.ShortTermMemory_STM_BAD
	case domain.STMNormal:
		return user_progress_card.ShortTermMemory_STM_NORMAL
	case domain.STMGood:
		return user_progress_card.ShortTermMemory_STM_GOOD
	case domain.STMPerfect:
		return user_progress_card.ShortTermMemory_STM_PERFECT
	default:
		return user_progress_card.ShortTermMemory_STM_UNKNOWN
	}
}
func MapUserProgressCardsToProtoGetResponse(cards []*entities.UserProgressCard) *user_progress_card.GetProgressCardsByDeckIDResponse {
	pbCards := make([]*user_progress_card.UserProgressCard, 0, len(cards))

	for _, c := range cards {
		pbCard := &user_progress_card.UserProgressCard{
			UserId:          int32(c.UserID),
			CardId:          int32(c.CardID),
			Question:        c.Question,
			Answer:          c.Answer,
			ShortTermMemory: ToProtoShortTermMemory(c.ShortTermMemory),
			LongTermMemory:  int32(c.LongTermMemory),
			RepetitionCount: int32(c.RepetitionCount),
			DeckId:          int32(c.DeckID),
		}
		if c.NextReviewDate != nil {
			pbCard.NextReviewDate = timestamppb.New(*c.NextReviewDate)
		}
		if c.LastReviewedAt != nil {
			pbCard.LastReviewedAt = timestamppb.New(*c.LastReviewedAt)
		}

		pbCards = append(pbCards, pbCard)
	}

	return &user_progress_card.GetProgressCardsByDeckIDResponse{
		ProgressCards: pbCards,
	}
}
func MapProtoToUserProgressCards(pbCards []*user_progress_card.UserProgressCard) []*entities.UserProgressCard {
	cards := make([]*entities.UserProgressCard, 0, len(pbCards))

	for _, c := range pbCards {
		card := &entities.UserProgressCard{
			UserID:          int(c.UserId),
			CardID:          int(c.CardId),
			Question:        c.Question,
			Answer:          c.Answer,
			ShortTermMemory: ToDomainShortTermMemory(c.ShortTermMemory),
			LongTermMemory:  int(c.LongTermMemory),
			RepetitionCount: int(c.RepetitionCount),
			DeckID:          int(c.DeckId),
			NextReviewDate:  timestampToTimePtr(c.NextReviewDate),
			LastReviewedAt:  timestampToTimePtr(c.LastReviewedAt),
		}
		cards = append(cards, card)
	}

	return cards
}
func MapUserProgressCardsToProto(cards []*entities.UserProgressCard) []*user_progress_card.UserProgressCard {
	pbCards := make([]*user_progress_card.UserProgressCard, 0, len(cards))

	for _, c := range cards {
		pbCard := &user_progress_card.UserProgressCard{
			UserId:          int32(c.UserID),
			CardId:          int32(c.CardID),
			Question:        c.Question,
			Answer:          c.Answer,
			ShortTermMemory: ToProtoShortTermMemory(c.ShortTermMemory),
			LongTermMemory:  int32(c.LongTermMemory),
			RepetitionCount: int32(c.RepetitionCount),
			DeckId:          int32(c.DeckID),
		}
		if c.NextReviewDate != nil {
			pbCard.NextReviewDate = timestamppb.New(*c.NextReviewDate)
		}
		if c.LastReviewedAt != nil {
			pbCard.LastReviewedAt = timestamppb.New(*c.LastReviewedAt)
		}
		pbCards = append(pbCards, pbCard)
	}

	return pbCards
}
