package validation

import "errors"

var (
	ErrUsernameLength  = errors.New("username must be between 3 and 30 characters long")
	ErrUsernameStart   = errors.New("username must start with a letter")
	ErrUsernameEnd     = errors.New("username must end with a letter or digit")
	ErrUsernameCharset = errors.New("username must contain only letters, digits, '_' and '-'")

	ErrInvalidEmailFormat = errors.New("invalid email format")

	ErrPasswordLength = errors.New("password must be at least 8 characters long")
	ErrPasswordPolicy = errors.New("password must contain upper, lower case letters and digits")
)
