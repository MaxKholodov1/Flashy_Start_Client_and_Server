package user_use_cases

import (
	"context"
	"errors"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/validation"
	"log/slog"

	"github.com/jackc/pgx/v5"
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
		slog.Error("Failed checking user email availability, db error", "err", err)
		return false, use_cases.ErrDBFailure(err)
	}

	return false, use_cases.ErrEmailTaken
}
