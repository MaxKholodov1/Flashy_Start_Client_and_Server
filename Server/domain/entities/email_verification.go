package entities

import "time"

type EmailVerification struct {
	UserID    int // тип int, как в таблице users.id
	Code      string
	ExpiresAt time.Time
}
