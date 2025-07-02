package repositories

import "go_server/domain/entities"

type UserRepository interface {
	Create(user *entities.User) (int, error)
	GetByID(id int) (*entities.User, error)
	GetByUserName(userName string) (*entities.User, error)
	GetByEmail(email string) (*entities.User, error)
	Update(user *entities.User) error
}
