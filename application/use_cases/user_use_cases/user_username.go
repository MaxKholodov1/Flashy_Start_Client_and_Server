package user_use_cases

import (
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"go_server/application/use_cases"
	"go_server/domain/validation"
	"log"
)

func (u *UserUseCases) CheckUserNameAvailability(ctx context.Context, userName string) (bool, error) {
	if err := validation.ValidateUsername(userName); err != nil {
		return false, err
	}
	log.Println("DEBUG: before create repo") // ← это должно точно появиться
	_, err := u.userRepository.GetByUserName(userName)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return true, nil
		}
		log.Println(err.Error()) // ← это должно точно появиться
		return false, use_cases.ErrDBFailure(err)
	}

	return false, use_cases.ErrUsernameTaken
}
