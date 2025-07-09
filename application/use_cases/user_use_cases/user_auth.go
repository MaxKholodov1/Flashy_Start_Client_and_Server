package user_use_cases

import (
	"context"
	"errors"
	"fmt"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"golang.org/x/crypto/bcrypt"
	"log/slog"
	"strings"
)

func (u *UserUseCases) Login(ctx context.Context, identifier, password string) (*entities.User, bool, bool, error) {
	var user *entities.User
	var err error

	if strings.Contains(identifier, "@") {
		user, err = u.userRepository.GetByEmail(identifier)
	} else {
		user, err = u.userRepository.GetByUserName(identifier)
	}

	if errors.Is(err, pgx.ErrNoRows) {
		return nil, false, false, use_cases.ErrUserNotFound
	} else if err != nil {
		slog.Error("Failed getting user", "identifier", identifier, "err", err)
		return nil, false, false, fmt.Errorf("failed to get user: %w", err)
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.PasswordHash), []byte(password)); err != nil {
		slog.Error("Failed comparing password", "identifier", identifier, "err", err)
		return nil, false, false, use_cases.ErrIncorrectPassword
	}
	isVerified, err := u.userRepository.IsEmailVerified(ctx, int(user.ID))
	if err != nil {
		slog.Error("Failed checking if email verified", "identifier", identifier, "err", err)
		return nil, false, false, use_cases.ErrDBFailure(err)
	}
	if isVerified == false {
		return user, true, false, nil
	}
	return user, true, true, nil
}
