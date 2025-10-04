package entities

import "time"

type GlobalCard struct {
	ID        int       `json:"id"`
	DeckID    int       `json:"deck_id"`
	Question  string    `json:"question"`
	Answer    string    `json:"answer"`
	AuthorID  int       `json:"author_id"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
	Version   int       `json:"version"`
}
