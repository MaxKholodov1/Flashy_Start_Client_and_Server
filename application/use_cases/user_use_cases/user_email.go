package user_use_cases

import (
	"context"
	"errors"
	"go_server/application/use_cases"

	"github.com/jackc/pgx/v5"
	"go_server/domain/validation"
)

func (u *UserUseCases) CheckUserEmailAvailability(ctx context.Context, userEmail string) (bool, error) {
	if err := validation.ValidateEmail(userEmail); err != nil {
		return false, err
	}

	_, err := u.userRepository.GetByEmail(userEmail)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return true, nil
		}
		return false, use_cases.ErrDBFailure
	}

	return false, use_cases.ErrEmailTaken
}
