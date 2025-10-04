package services

import (
	"go_server/Server/domain"
	"go_server/Server/domain/entities"
)

func findFirstPerfect(cards []*entities.UserProgressCard) int {
	for i, card := range cards {
		if card.ShortTermMemory == domain.STMPerfect {
			return i
		}
	}
	return -1 // если не найдено
}
func findLastBad(cards []*entities.UserProgressCard) int {
	for i := len(cards) - 1; i >= 0; i-- {
		if cards[i].ShortTermMemory == domain.STMBad {
			return i
		}
	}
	return -1 // если не найдено
}
func findLastBadOrNormal(cards []*entities.UserProgressCard) int {
	for i := len(cards) - 1; i >= 0; i-- {
		if cards[i].ShortTermMemory == domain.STMBad || cards[i].ShortTermMemory == domain.STMNormal {
			return i
		}
	}
	return -1 // если не найдено
}
func firstToJ[T any](cards []T, j int) []T {
	first := cards[0]
	cards = cards[1:]

	newCards := make([]T, 0, len(cards)+1)

	// Копируем элементы до позиции j-1
	newCards = append(newCards, cards[:j-1]...)

	newCards = append(newCards, first)

	newCards = append(newCards, cards[j-1:]...)

	return newCards
}

func ShuffleProgressCards(cards []*entities.UserProgressCard) []*entities.UserProgressCard {
	if len(cards) == 0 {
		return []*entities.UserProgressCard{}
	}
	if len(cards) == 1 {
		return cards
	}
	if len(cards) == 2 {
		return firstToJ(cards, 2)
	}
	if cards[0].ShortTermMemory == domain.STMUnknown {
		return firstToJ(cards, len(cards))
	}
	if cards[0].ShortTermMemory == domain.STMPerfect {
		return firstToJ(cards, len(cards))
	}
	if cards[0].ShortTermMemory == domain.STMGood {
		ind := findFirstPerfect(cards)
		if ind == -1 {
			ind = len(cards)
		}
		ind = max(2, ind)
		return firstToJ(cards, ind)
	}
	if cards[0].ShortTermMemory == domain.STMNormal {
		ind := findLastBad(cards)
		return firstToJ(cards, max(ind, min(4, len(cards))))
	}
	if cards[0].ShortTermMemory == domain.STMBad {
		ind := findFirstPerfect(cards)
		return firstToJ(cards, max(ind, min(4, len(cards))))
	}

	return firstToJ(cards, len(cards)-1)
}
