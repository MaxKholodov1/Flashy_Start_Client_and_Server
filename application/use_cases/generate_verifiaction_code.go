package use_cases

import (
	"crypto/rand"
	"fmt"
	"math/big"
)

func GenerateVerificationCode() string {
	max := big.NewInt(1000000) // 000000 to 999999
	n, err := rand.Int(rand.Reader, max)
	if err != nil {
		// fallback на случай крайне редкой ошибки
		return "000000"
	}
	return fmt.Sprintf("%06d", n.Int64())
}
