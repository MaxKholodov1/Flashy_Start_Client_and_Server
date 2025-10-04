package user_use_cases

import (
	"context"
	"go_server/Server/domain/validation"
)

func (u *UserUseCases) CheckPasswordValidity(ctx context.Context, password string) error {
	return validation.ValidatePassword(password)
}
