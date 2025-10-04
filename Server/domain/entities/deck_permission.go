package entities

type DeckPermission struct {
	ID     int    `json:"id"`
	UserID int    `json:"user_id"`
	DeckID int    `json:"deck_id"`
	Role   string `json:"role"`
}
