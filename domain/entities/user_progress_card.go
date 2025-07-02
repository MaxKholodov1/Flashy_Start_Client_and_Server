package entities

import (
	"go_server/domain"
	"time"
)

type UserProgressCard struct {
	UserID          int
	CardID          int
	Question        string
	Answer          string
	NextReviewDate  *time.Time
	LastReviewedAt  *time.Time
	ShortTermMemory domain.ShortTermMemory
	LongTermMemory  int
	RepetitionCount int
	DeckID          int
}
