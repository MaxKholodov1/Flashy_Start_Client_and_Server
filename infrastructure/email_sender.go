package infrastructure

import (
	"crypto/tls"
	"fmt"
	"net/smtp"
	"strings"
)

type SmtpEmailSender struct {
	SMTPHost  string // например, smtp.yandex.ru
	SMTPPort  int    // 465
	Username  string // полный email: your@yandex.ru
	Password  string // пароль или app password
	FromEmail string // обычно тот же email
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

	// TLS-соединение с сервером
	tlsConfig := &tls.Config{
		InsecureSkipVerify: false,
		ServerName:         s.SMTPHost,
	}

	conn, err := tls.Dial("tcp", addr, tlsConfig)
	if err != nil {
		return fmt.Errorf("tls dial failed: %w", err)
	}
	defer conn.Close()

	client, err := smtp.NewClient(conn, s.SMTPHost)
	if err != nil {
		return fmt.Errorf("smtp client creation failed: %w", err)
	}
	defer client.Close()

	// Аутентификация
	auth := smtp.PlainAuth("", s.Username, s.Password, s.SMTPHost)
	if err := client.Auth(auth); err != nil {
		return fmt.Errorf("smtp auth failed: %w", err)
	}

	if err := client.Mail(s.FromEmail); err != nil {
		return fmt.Errorf("MAIL FROM failed: %w", err)
	}
	if err := client.Rcpt(toEmail); err != nil {
		return fmt.Errorf("RCPT TO failed: %w", err)
	}

	writer, err := client.Data()
	if err != nil {
		return fmt.Errorf("DATA command failed: %w", err)
	}
	_, err = writer.Write([]byte(msg))
	if err != nil {
		return fmt.Errorf("message write failed: %w", err)
	}
	if err := writer.Close(); err != nil {
		return fmt.Errorf("DATA close failed: %w", err)
	}

	return client.Quit()
}
