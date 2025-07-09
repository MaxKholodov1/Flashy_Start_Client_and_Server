package infrastructure

import (
	"fmt"
	"net/smtp"
)

type SmtpEmailSender struct {
	SMTPHost  string
	SMTPPort  int
	Username  string // Почта на домене
	Password  string // API ключ
	FromEmail string // Тоже твоя доменная почта
}

func NewSmtpEmailSender(host string, port int, username, password, from string) *SmtpEmailSender {
	return &SmtpEmailSender{
		SMTPHost:  host,
		SMTPPort:  port,
		Username:  username,
		Password:  password,
		FromEmail: from,
	}
}

func (s *SmtpEmailSender) SendVerificationCode(toEmail string, code string) error {
	auth := smtp.PlainAuth("", s.Username, s.Password, s.SMTPHost)

	subject := "Email Verification Code"
	body := fmt.Sprintf("Your verification code is: %s", code)

	msg := []byte("To: " + toEmail + "\r\n" +
		"Subject: " + subject + "\r\n" +
		"Content-Type: text/plain; charset=\"utf-8\"\r\n" +
		"\r\n" +
		body + "\r\n")

	addr := fmt.Sprintf("%s:%d", s.SMTPHost, s.SMTPPort)

	return smtp.SendMail(addr, auth, s.FromEmail, []string{toEmail}, msg)
}
