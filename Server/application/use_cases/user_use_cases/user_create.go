package user_use_cases

import (
	"context"
	"fmt"
	use_cases2 "go_server/Server/application/use_cases"
	entities2 "go_server/Server/domain/entities"
	"go_server/Server/domain/validation"
	"golang.org/x/crypto/bcrypt"
	"log/slog"
	"time"
)

func (u *UserUseCases) CreateUser(ctx context.Context, user *entities2.User) (int, error) {
	isAvailUN, err := u.CheckUserNameAvailability(ctx, user.UserName)
	if err != nil {
		return 0, err
	}
	if !isAvailUN {
		return 0, use_cases2.ErrUsernameTaken
	}

	isAvailE, err := u.CheckUserEmailAvailability(ctx, user.Email)
	if err != nil {
		return 0, err
	}
	if !isAvailE {
		return 0, use_cases2.ErrEmailTaken
	}

	if err := validation.ValidatePassword(user.PasswordHash); err != nil {
		return 0, err
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.PasswordHash), bcrypt.DefaultCost)
	if err != nil {
		slog.Error("Failed hashing password", "err", err)
		return 0, use_cases2.ErrFailedToGeneratePasswordHash
	}
	user.PasswordHash = string(hashedPassword)
	id, err := u.userRepository.Create(user)
	if err != nil {
		slog.Error("Failed creating user", "err", err)
		return 0, use_cases2.ErrDBFailure(err)
	}
	// Генерация кода подтверждения (6 цифр)
	code := use_cases2.GenerateVerificationCode()

	// Сохраняем код
	verification := &entities2.EmailVerification{
		UserID:    id,
		Code:      code,
		ExpiresAt: time.Now().UTC().Add(15 * time.Minute),
	}
	if err := u.emailVerificationRepository.Upsert(ctx, verification); err != nil {
		slog.Error("Failed to save email verification", "err", err)
		return 0, use_cases2.ErrVerificationError
	}
	// Отправка email
	if err := u.emailSender.SendVerificationCode(user.Email, code); err != nil {
		slog.Error("Failed to send verification email", "err", err)
		return 0, use_cases2.ErrVerificationError
	}
	return id, nil
}

func (u *UserUseCases) CreateDefUser(ctx context.Context) (int, error) {
	// Генерация уникального имени (например, user_1693665341234)
	timestamp := time.Now().UnixNano()
	userName := fmt.Sprintf("user_%d", timestamp)
	email := fmt.Sprintf("%s@example.com", userName)

	// На всякий случай проверим доступность (маловероятно, но вдруг совпадение)
	isAvailUN, err := u.CheckUserNameAvailability(ctx, userName)
	if err != nil {
		return 0, err
	}
	if !isAvailUN {
		return 0, use_cases2.ErrUsernameTaken
	}

	isAvailE, err := u.CheckUserEmailAvailability(ctx, email)
	if err != nil {
		return 0, err
	}
	if !isAvailE {
		return 0, use_cases2.ErrEmailTaken
	}

	// Дефолтный пароль (например, тоже userName, либо жёстко "defaultPass123")
	defaultPassword := userName + "_password123432A"

	if err := validation.ValidatePassword(defaultPassword); err != nil {
		return 0, err
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(defaultPassword), bcrypt.DefaultCost)
	if err != nil {
		slog.Error("Failed hashing password", "err", err)
		return 0, use_cases2.ErrFailedToGeneratePasswordHash
	}

	user := &entities2.User{
		UserName:     userName,
		Email:        email,
		PasswordHash: string(hashedPassword),
		// можно задать дефолтные поля вроде роли, даты и т.д.
	}

	id, err := u.userRepository.Create(user)
	if err != nil {
		slog.Error("Failed creating default user", "err", err)
		return 0, use_cases2.ErrDBFailure(err)
	}
	return id, nil
}
