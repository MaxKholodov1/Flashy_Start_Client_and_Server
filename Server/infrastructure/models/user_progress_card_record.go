package models

import (
	"go_server/Server/domain"
	"time"
)

type UserProgressCardRecord struct {
	DeckID          int
	UserID          int
	CardID          int
	NextReviewDate  *time.Time
	LastReviewedAt  *time.Time
	ShortTermMemory domain.ShortTermMemory
	LongTermMemory  int
	RepetitionCount int
}
