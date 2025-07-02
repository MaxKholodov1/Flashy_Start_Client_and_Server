package entities

import (
	"go_server/domain"
)

func UpdateCardShortTermMemory(card UserProgressCard, quality domain.RecallQuality) UserProgressCard {
	newCard := card

	switch newCard.ShortTermMemory {
	case domain.STMUnknown:
		switch quality {
		case domain.Perfect:
			newCard.ShortTermMemory = domain.STMPerfect
		case domain.Good:
			newCard.ShortTermMemory = domain.STMGood
		case domain.Normal:
			newCard.ShortTermMemory = domain.STMNormal
		case domain.Bad:
			newCard.ShortTermMemory = domain.STMBad
		}

	case domain.STMGood, domain.STMPerfect:
		switch quality {
		case domain.Good, domain.Perfect:
			newCard.ShortTermMemory = domain.STMPerfect
		case domain.Normal:
			newCard.ShortTermMemory = domain.STMNormal
		case domain.Bad:
			newCard.ShortTermMemory = domain.STMBad
		}

	case domain.STMNormal:
		switch quality {
		case domain.Perfect:
			newCard.ShortTermMemory = domain.STMPerfect
		case domain.Good:
			newCard.ShortTermMemory = domain.STMGood
		case domain.Bad, domain.Normal:
			newCard.ShortTermMemory = domain.STMBad
		}

	case domain.STMBad:
		switch quality {
		case domain.Perfect, domain.Good:
			newCard.ShortTermMemory = domain.STMNormal
		case domain.Normal, domain.Bad:
			newCard.ShortTermMemory = domain.STMBad
		}
	}

	if newCard.ShortTermMemory == domain.STMUnknown {
		newCard.ShortTermMemory = domain.STMUnknown
	}

	return newCard
}
