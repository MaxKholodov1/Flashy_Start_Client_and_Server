package repositories

import (
	"context"
	"github.com/jackc/pgx/v5"
	"go_server/domain/entities"
)

type GlobalCardRepository interface {
	CreateCard(answer, question string, authorID, deckID, version int) (*entities.GlobalCard, error)
	GetCardsByDeckID(deckID int) ([]*entities.GlobalCard, error)
	UpdateCardByID(id int, question, answer string, version int) error
	GetGlobalCardByID(id int) (*entities.GlobalCard, error)
	DeleteCardByID(id int) error
	DeleteCardsByAuthorIDTX(ctx context.Context, tx pgx.Tx, authorID int) error
	DeleteByDeckIDTx(ctx context.Context, tx pgx.Tx, deckID int) error
}
