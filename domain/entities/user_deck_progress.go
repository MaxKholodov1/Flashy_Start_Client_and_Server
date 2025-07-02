package entities

import "time"

type UserDeckProgress struct {
	UserID         int
	DeckID         int
	Title          string
	Description    string
	LastReviewedAt time.Time
	Score          int
}
