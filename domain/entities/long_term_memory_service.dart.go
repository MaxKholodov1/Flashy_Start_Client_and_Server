package entities

import (
	"go_server/domain"
	"time"
)

func isDateToday(t time.Time) bool {
	now := time.Now()
	y1, m1, d1 := now.Date()
	y2, m2, d2 := t.Date()
	return y1 == y2 && m1 == m2 && d1 == d2
}

func UpdateCardLongTermMemory(card UserProgressCard, quality domain.RecallQuality) UserProgressCard {
	now := time.Now()
	today := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location())

	newCard := card

	if quality == domain.Bad || quality == domain.Normal || newCard.LongTermMemory == 0 {
		newCard.LongTermMemory = 1
		newCard.LastReviewedAt = &today
		newCard.NextReviewDate = ptrTime(today.AddDate(0, 0, 1))
		return newCard
	}

	if newCard.LastReviewedAt == nil || newCard.NextReviewDate == nil {
		newCard.LastReviewedAt = &today
		newCard.NextReviewDate = ptrTime(today.AddDate(0, 0, 1))
		newCard.LongTermMemory = 1
		return newCard
	}

	if !isDateToday(*newCard.LastReviewedAt) &&
		(isDateToday(*newCard.NextReviewDate) || newCard.NextReviewDate.Before(now)) {

		if newCard.LongTermMemory < 10 {
			newCard.LongTermMemory++
		}
		newCard.LastReviewedAt = &today

		intervals := []int{
			1, 2, 4, 7, 12, 20, 30, 45, 60, 90,
		}

		box := newCard.LongTermMemory
		if box >= 1 && box <= len(intervals) {
			newCard.NextReviewDate = ptrTime(today.AddDate(0, 0, intervals[box-1]))
		} else {
			newCard.NextReviewDate = ptrTime(today.AddDate(0, 0, 120))
		}
	}

	return newCard
}

func ptrTime(t time.Time) *time.Time {
	return &t
}
