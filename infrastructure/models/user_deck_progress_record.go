package models

import "time"

type UserDeckProgressRecord struct {
	UserID         int
	DeckID         int
	LastReviewedAt time.Time
	Score          int
}
