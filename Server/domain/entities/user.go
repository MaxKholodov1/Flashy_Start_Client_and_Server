package entities

import "time"

type User struct {
	ID           int32      `json:"id"`
	UserName     string     `json:"userName"`
	Email        string     `json:"email"`
	PasswordHash string     `json:"password_hash"`
	CreatedAt    *time.Time `json:"created_at"`
}
