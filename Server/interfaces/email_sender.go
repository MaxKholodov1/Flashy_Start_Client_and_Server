package interfaces

type EmailSender interface {
	SendVerificationCode(toEmail string, code string) error
	SendNewPassword(toEmail string, newPassword string) error
}
