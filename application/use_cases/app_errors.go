package use_cases

import (
	"errors"
	"fmt"
)

var (
	ErrUsernameTaken = errors.New("username is already taken")

	ErrDBFailureBase = errors.New("database failure")

	ErrEmailTaken                      = errors.New("email is already taken")
	ErrAccessTokenInvalidSignature     = errors.New("access token has invalid signature")
	ErrAccessTokenInvalid              = errors.New("access token is invalid")
	ErrAccessTokenInvalidClaims        = errors.New("access token has invalid claims")
	ErrAccessTokenMissingUserID        = errors.New("access token missing user_id claim")
	ErrAccessTokenExpired              = errors.New("access token has expired")
	ErrRefreshTokenInvalidSignature    = errors.New("refresh token has invalid signature")
	ErrRefreshTokenInvalid             = errors.New("refresh token is invalid")
	ErrRefreshTokenInvalidClaims       = errors.New("refresh token has invalid claims")
	ErrRefreshTokenMissingUserID       = errors.New("refresh token missing user_id claim")
	ErrRefreshTokenExpired             = errors.New("refresh token has expired")
	ErrMetadataNotProvided             = errors.New("metadata not provided")
	ErrAuthorizationTokenMissing       = errors.New("authorization token not found in metadata")
	ErrAuthorizationTokenInvalidFormat = errors.New("authorization token has invalid format")
	ErrUserNotFound                    = errors.New("user not found")
	ErrIncorrectPassword               = errors.New("incorrect password")
	ErrFailedToGenerateToken           = errors.New("failed to generate token")
	ErrFailedToGeneratePasswordHash    = errors.New("failed to create password hash")
	ErrInvalidTitleOfGlobalDeck        = errors.New("invalid titleOfGlobalDeck")
	ErrDeckPermissionDenied            = errors.New("deck permission denied")
	ErrInvalidQuestionOfTheCard        = errors.New("invalid question of the Card")
	ErrInvalidAnswerOfTheCard          = errors.New("invalid answer of the Card")
	ErrGlobalCardNotFound              = errors.New("global card not found")
	ErrPermissionAlreadyExists         = errors.New("permission already exists")
	ErrNoRowsUpdated                   = errors.New("no rows updated")
	ErrSuchPermissionAlreadyExists     = errors.New("such permission already exists")
	ErrAuthorCantDeleteProgressDeck    = errors.New("author can't delete progress deck")
	ErrPermissionNotFound              = errors.New("permission not found")
	ErrFailedToSendEmail               = errors.New("failed to send email")
)

func ErrDBFailure(err error) error {
	if err == nil {
		return ErrDBFailureBase
	}
	return fmt.Errorf("%w: %v", ErrDBFailureBase, err)
}
