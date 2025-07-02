package user_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
	"go_server/domain/validation"
	"golang.org/x/crypto/bcrypt"
	"log"
)

func (u *UserUseCases) CreateUser(ctx context.Context, user *entities.User) (int, error) {
	isAvailUN, err := u.CheckUserNameAvailability(ctx, user.UserName)
	if err != nil {
		return 0, err
	}
	if !isAvailUN {
		return 0, use_cases.ErrUsernameTaken
	}

	isAvailE, err := u.CheckUserEmailAvailability(ctx, user.Email)
	if err != nil {
		return 0, err
	}
	if !isAvailE {
		return 0, use_cases.ErrEmailTaken
	}

	if err := validation.ValidatePassword(user.PasswordHash); err != nil {
		return 0, err
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.PasswordHash), bcrypt.DefaultCost)
	if err != nil {
		return 0, use_cases.ErrFailedToGeneratePasswordHash
	}
	user.PasswordHash = string(hashedPassword)
	log.Println("DEBUG: before create repo") // ← это должно точно появиться
	log.Printf("DEBUG: userRepo = %#v", u.userRepository)
	id, err := u.userRepository.Create(user)
	if err != nil {
		return 0, use_cases.ErrDBFailure(err)
	}

	return id, nil
}
