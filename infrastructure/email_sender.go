package infrastructure

import (
	"fmt"
	"net/smtp"
	"strings"
)

type SmtpEmailSender struct {
	SMTPHost  string
	SMTPPort  int
	Username  string // полный email
	Password  string // пароль или app password
	FromEmail string // email отправителя
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

	auth := smtp.PlainAuth("", s.Username, s.Password, s.SMTPHost)

	return smtp.SendMail(addr, auth, s.FromEmail, []string{toEmail}, []byte(msg))
}
