package global_deck_use_cases

import (
	"context"
	"go_server/application/use_cases"
	"go_server/domain/entities"
)

func (u *GlobalDeckUseCases) GetGlobalDeckInfoByID(ctx context.Context, deckID int) (*entities.GlobalDeck, *string, []string, error) {
	accessToken, err := u.tokenService.GetTokenFromMetadata(ctx)
	if err != nil {
		return nil, nil, nil, use_cases.ErrAccessTokenInvalid
	}
	userID, err := u.tokenService.ParseAccessToken(accessToken)
	if err != nil {
		return nil, nil, nil, use_cases.ErrAccessTokenInvalid
	}
	deck, ok := u.globalDeckRepository.GetByID(deckID)
	if ok != nil {
		return nil, nil, nil, use_cases.ErrDBFailure
	}
	var authorID int = deck.AuthorID
	author, err := u.userRepository.GetByID(authorID)
	if err != nil {
		return nil, nil, nil, use_cases.ErrDBFailure
	}
	var permissions []*entities.DeckPermission
	permissions, err = u.deckPermissionRepository.GetDeckPermissionsByDeckID(ctx, deckID)
	if err != nil {
		return nil, nil, nil, use_cases.ErrDBFailure
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
				return nil, nil, nil, use_cases.ErrDBFailure
			}
			editorNames = append(editorNames, editor.UserName)
		}
	}
	if deck.IsPublic == false && authorID != userID && isEditor == false {
		return nil, nil, nil, use_cases.ErrDeckPermissionDenied
	}
	return deck, &author.UserName, editorNames, nil
}
