package entities

import "time"

type GlobalDeck struct {
	ID          int       `json:"id"`
	Title       string    `json:"title"`
	Description *string   `json:"description"`
	AuthorID    int       `json:"author_id"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
	IsPublic    bool      `json:"is_public"`
	Tags        []string  `json:"tags"`
	Version     int       `json:"version"`
}
