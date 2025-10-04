package entities

import (
	domain2 "go_server/Server/domain"
)

func UpdateCardShortTermMemory(card UserProgressCard, quality domain2.RecallQuality) UserProgressCard {
	newCard := card

	switch newCard.ShortTermMemory {
	case domain2.STMUnknown:
		switch quality {
		case domain2.Perfect:
			newCard.ShortTermMemory = domain2.STMPerfect
		case domain2.Good:
			newCard.ShortTermMemory = domain2.STMGood
		case domain2.Normal:
			newCard.ShortTermMemory = domain2.STMNormal
		case domain2.Bad:
			newCard.ShortTermMemory = domain2.STMBad
		}

	case domain2.STMGood, domain2.STMPerfect:
		switch quality {
		case domain2.Good, domain2.Perfect:
			newCard.ShortTermMemory = domain2.STMPerfect
		case domain2.Normal:
			newCard.ShortTermMemory = domain2.STMNormal
		case domain2.Bad:
			newCard.ShortTermMemory = domain2.STMBad
		}

	case domain2.STMNormal:
		switch quality {
		case domain2.Perfect:
			newCard.ShortTermMemory = domain2.STMPerfect
		case domain2.Good:
			newCard.ShortTermMemory = domain2.STMGood
		case domain2.Bad, domain2.Normal:
			newCard.ShortTermMemory = domain2.STMBad
		}

	case domain2.STMBad:
		switch quality {
		case domain2.Perfect, domain2.Good:
			newCard.ShortTermMemory = domain2.STMNormal
		case domain2.Normal, domain2.Bad:
			newCard.ShortTermMemory = domain2.STMBad
		}
	}

	if newCard.ShortTermMemory == domain2.STMUnknown {
		newCard.ShortTermMemory = domain2.STMUnknown
	}

	return newCard
}
