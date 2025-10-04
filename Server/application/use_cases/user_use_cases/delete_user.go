package user_use_cases

import (
	"context"
	"fmt"
	"go_server/Server/application/use_cases"
	"log/slog"
)

func (u *UserUseCases) DeleteUser(ctx context.Context) (bool, error) {
	// Начинаем транзакцию
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return false, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed to parse the access token", "err", err)
		return false, use_cases.ErrAccessTokenInvalid
	}
	tx, err := u.userRepository.BeginTx(ctx)
	if err != nil {
		return false, fmt.Errorf("failed to begin transaction: %w", err)
	}

	// Флаг для отката транзакции
	needRollback := false
	defer func() {
		if needRollback {
			tx.Rollback(ctx)
		}
	}()

	// 1. Удаляем email verification
	if err := u.emailVerificationRepository.DeleteByUserIDTX(ctx, tx, userID); err != nil {
		needRollback = true
		return false, fmt.Errorf("failed to delete email verifications: %w", err)
	}

	// 2. Удаляем все карточки в которых пользователь автор
	if err := u.globalCardRepository.DeleteCardsByAuthorIDTX(ctx, tx, userID); err != nil {
		needRollback = true
		return false, fmt.Errorf("failed to delete user cards: %w", err)
	}

	// 3. Удаляем все колоды пользователя
	decks, err := u.globalDeckRepository.ListByUserTx(ctx, tx, userID)
	if err != nil {
		needRollback = true
		return false, fmt.Errorf("failed to get user decks: %w", err)
	}

	// 4. Для каждой колоды сначала удаляем карточки
	for _, deck := range decks {
		if err := u.globalCardRepository.DeleteByDeckIDTx(ctx, tx, deck.ID); err != nil {
			needRollback = true
			return false, fmt.Errorf("failed to delete cards for deck %d: %w", deck.ID, err)
		}
	}

	// 5. Удаляем все колоды
	if err := u.globalDeckRepository.DeleteByAuthorIDTx(ctx, tx, userID); err != nil {
		needRollback = true
		return false, fmt.Errorf("failed to delete user decks: %w", err)
	}

	// 6. Удаляем permissions пользователя
	if err := u.deckPermissionRepository.DeleteAllPermissionsForUserTx(ctx, tx, userID); err != nil {
		needRollback = true
		return false, fmt.Errorf("failed to delete user permissions: %w", err)
	}

	// 7. Удаляем самого пользователя
	if err := u.userRepository.DeleteUserTx(ctx, tx, userID); err != nil {
		needRollback = true
		return false, fmt.Errorf("failed to delete user: %w", err)
	}

	// Коммитим транзакцию, если все успешно
	if err := tx.Commit(ctx); err != nil {
		needRollback = true // Хотя транзакция уже будет завершена, флаг для ясности
		return false, fmt.Errorf("failed to commit transaction: %w", err)
	}

	return true, nil
}
