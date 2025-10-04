package user_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/Server/application/use_cases"
	"go_server/Server/domain/validation"
	"log/slog"
)

func (u *UserUseCases) CheckUserNameAvailability(ctx context.Context, userName string) (bool, error) {
	if err := validation.ValidateUsername(userName); err != nil {
		return false, err
	}
	_, err := u.userRepository.GetByUserName(userName)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return true, nil
		}
		slog.Error("Failed checking username availability, db error", "userName", userName, "err", err)
		return false, use_cases.ErrDBFailure(err)
	}

	return false, use_cases.ErrUsernameTaken
}
