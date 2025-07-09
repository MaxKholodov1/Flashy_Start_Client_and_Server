package infrastructure

import (
	"crypto/tls"
	"fmt"
	"net/smtp"
	"strings"
)

type SmtpEmailSender struct {
	SMTPHost  string
	SMTPPort  int
	Username  string // полный email, например no-reply@flashystart.com
	Password  string // пароль от ящика или App Password
	FromEmail string // тоже no-reply@flashystart.com
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

func (s *SmtpEmailSender) SendVerificationCode(toEmail, code string) error {
	subject := "Email Verification Code"
	body := fmt.Sprintf("Your verification code is: %s", code)

	msg := strings.Join([]string{
		fmt.Sprintf("From: %s", s.FromEmail),
		fmt.Sprintf("To: %s", toEmail),
		fmt.Sprintf("Subject: %s", subject),
		"MIME-Version: 1.0",
		"Content-Type: text/plain; charset=\"utf-8\"",
		"",
		body,
	}, "\r\n")

	addr := fmt.Sprintf("%s:%d", s.SMTPHost, s.SMTPPort)

	// Подключаемся к серверу SMTP с TLS (STARTTLS через 587)
	conn, err := tls.Dial("tcp", addr, &tls.Config{
		ServerName: s.SMTPHost,
	})
	if err != nil {
		return fmt.Errorf("failed to dial SMTP server: %w", err)
	}
	defer conn.Close()

	client, err := smtp.NewClient(conn, s.SMTPHost)
	if err != nil {
		return fmt.Errorf("failed to create SMTP client: %w", err)
	}
	defer client.Close()

	// Аутентификация
	auth := smtp.PlainAuth("", s.Username, s.Password, s.SMTPHost)
	if err := client.Auth(auth); err != nil {
		return fmt.Errorf("SMTP auth failed: %w", err)
	}

	// Отправка письма
	if err := client.Mail(s.FromEmail); err != nil {
		return fmt.Errorf("MAIL FROM failed: %w", err)
	}
	if err := client.Rcpt(toEmail); err != nil {
		return fmt.Errorf("RCPT TO failed: %w", err)
	}

	writer, err := client.Data()
	if err != nil {
		return fmt.Errorf("DATA start failed: %w", err)
	}
	_, err = writer.Write([]byte(msg))
	if err != nil {
		return fmt.Errorf("write failed: %w", err)
	}
	if err := writer.Close(); err != nil {
		return fmt.Errorf("DATA close failed: %w", err)
	}

	return client.Quit()
}
