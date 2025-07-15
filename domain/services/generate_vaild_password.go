package services

import (
	"crypto/rand"
	"math/big"
)

func GenerateValidPassword() (string, error) {
	const (
		lowerLetters = "abcdefghijklmnopqrstuvwxyz"
		upperLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		digits       = "0123456789"
		allChars     = lowerLetters + upperLetters + digits
		passwordLen  = 10
	)

	// Обязательно добавим по одному символу из каждого типа
	var password []byte

	// Добавим один символ из каждой категории
	categories := []string{lowerLetters, upperLetters, digits}
	for _, chars := range categories {
		c, err := randomCharFrom(chars)
		if err != nil {
			return "", err
		}
		password = append(password, c)
	}

	// Оставшиеся символы
	for len(password) < passwordLen {
		c, err := randomCharFrom(allChars)
		if err != nil {
			return "", err
		}
		password = append(password, c)
	}

	// Перемешаем, чтобы обязательные символы не были в начале
	shuffle(password)

	return string(password), nil
}

// Выбирает случайный символ из строки
func randomCharFrom(s string) (byte, error) {
	n, err := rand.Int(rand.Reader, big.NewInt(int64(len(s))))
	if err != nil {
		return 0, err
	}
	return s[n.Int64()], nil
}

// Перемешивает байты
func shuffle(b []byte) {
	for i := range b {
		j, _ := rand.Int(rand.Reader, big.NewInt(int64(i+1)))
		b[i], b[j.Int64()] = b[j.Int64()], b[i]
	}
}
