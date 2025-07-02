package validation

import (
	"net/mail"
	"regexp"
	"unicode"
)

var usernameRegex = regexp.MustCompile(`^[a-zA-Z][a-zA-Z0-9_-]{1,28}[a-zA-Z0-9]$`)

func ValidateUsername(username string) error {
	runes := []rune(username)
	if len(username) < 3 || len(username) > 30 {
		return ErrUsernameLength
	}
	if !unicode.IsLetter(runes[0]) {
		return ErrUsernameStart
	}
	if !unicode.IsLetter(runes[len(runes)-1]) && !unicode.IsDigit(runes[len(runes)-1]) {
		return ErrUsernameEnd
	}
	if !usernameRegex.MatchString(username) {
		return ErrUsernameCharset
	}
	return nil
}
func ValidateEmail(email string) error {
	if email == "" {
		return ErrInvalidEmailFormat
	}
	_, err := mail.ParseAddress(email)
	if err != nil {
		return ErrInvalidEmailFormat
	}
	return nil
}

func ValidatePassword(password string) error {
	if len(password) < 8 {
		return ErrPasswordLength
	}
	var hasUpper, hasLower, hasDigit bool
	for _, r := range password {
		switch {
		case unicode.IsUpper(r):
			hasUpper = true
		case unicode.IsLower(r):
			hasLower = true
		case unicode.IsDigit(r):
			hasDigit = true
		}
	}
	if !hasUpper || !hasLower || !hasDigit {
		return ErrPasswordPolicy
	}
	return nil
}
