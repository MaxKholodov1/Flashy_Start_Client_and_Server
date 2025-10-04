package global_deck_use_cases

import (
	"context"
	"go_server/Server/application/use_cases"
	entities2 "go_server/Server/domain/entities"
	"log/slog"
)

func (u *GlobalDeckUseCases) GetGlobalDeckInfoByID(ctx context.Context, deckID int) (*entities2.GlobalDeck, *string, []string, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		slog.Error("Failed to get access token", "err", err)
		return nil, nil, nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken, ctx)
	if err != nil {
		slog.Error("Failed to parse access token", "err", err)
		return nil, nil, nil, use_cases.ErrAccessTokenInvalid
	}
	deck, ok := u.globalDeckRepository.GetByID(deckID)
	if ok != nil {
		slog.Error("Failed to get global deck", "deckID", deckID, "userID", userID)
		return nil, nil, nil, use_cases.ErrDBFailure(err)
	}
	var authorID = deck.AuthorID
	author, err := u.userRepository.GetByID(authorID)
	if err != nil {
		slog.Error("Failed to get author", "authorID", authorID)
		return nil, nil, nil, use_cases.ErrDBFailure(err)
	}
	var permissions []*entities2.DeckPermission
	permissions, err = u.deckPermissionRepository.GetDeckPermissionsByDeckID(ctx, deckID)
	if err != nil {
		slog.Error("Failed to get permissions", "deckID", deckID, "userID", userID)
		return nil, nil, nil, use_cases.ErrDBFailure(err)
	}
	var isEditor = false
	var editorNames []string
	for _, permission := range permissions {
		if permission.Role == "Editor" {
			editor, err := u.userRepository.GetByID(permission.UserID)
			if permission.UserID == userID {
				isEditor = true
			}
			if err != nil {
				slog.Error("Failed to get editor", "userID", permission.UserID, "err", err)
				return nil, nil, nil, use_cases.ErrDBFailure(err)
			}
			editorNames = append(editorNames, editor.UserName)
		}
	}
	if deck.IsPublic == false && authorID != userID && isEditor == false {
		slog.Error("Deck permission denied")
		return nil, nil, nil, use_cases.ErrDeckPermissionDenied
	}
	return deck, &author.UserName, editorNames, nil
}
