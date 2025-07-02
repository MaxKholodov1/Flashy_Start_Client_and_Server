package repositories

import (
	"go_server/domain/entities"
)

type GlobalCardRepository interface {
	CreateCard(answer, question string, authorID, deckID, version int) (*entities.GlobalCard, error)
	GetCardsByDeckID(deckID int) ([]*entities.GlobalCard, error)
	UpdateCardByID(id int, question, answer string, version int) error
	GetGlobalCardByID(id int) (*entities.GlobalCard, error)
	DeleteCardByID(id int) error
}
