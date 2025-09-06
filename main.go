package main

import (
	"context"
	"go_server/application/services/token_services"
	"go_server/application/use_cases/global_card_use_cases"
	"go_server/application/use_cases/global_deck_use_cases"
	"go_server/application/use_cases/user_deck_progress_use_cases"
	"go_server/application/use_cases/user_progress_card_use_cases"
	"go_server/application/use_cases/user_use_cases"
	"go_server/infrastructure"
	global_card_service_server "go_server/infrastructure/grpc_infr/global_card"
	global_deck_service_server "go_server/infrastructure/grpc_infr/global_deck"
	auth_service_server "go_server/infrastructure/grpc_infr/user/auth"
	user_service_server "go_server/infrastructure/grpc_infr/user/user"
	validation_service_server "go_server/infrastructure/grpc_infr/user/validation"
	user_deck_progress_service_server "go_server/infrastructure/grpc_infr/user_deck_progress"
	user_progress_card_service_server "go_server/infrastructure/grpc_infr/user_progress_card"
	"go_server/infrastructure/interceptors"
	auth_server "go_server/interfaces/grpc_interfaces/auth_service_server"
	global_card_server "go_server/interfaces/grpc_interfaces/global_card_service_server"
	global_deck_server "go_server/interfaces/grpc_interfaces/global_deck_server"
	user_deck_progress_server "go_server/interfaces/grpc_interfaces/user_deck_progress_service_server"
	user_progress_card_server "go_server/interfaces/grpc_interfaces/user_progress_card_service_server"
	user_server "go_server/interfaces/grpc_interfaces/user_server"
	validation_server "go_server/interfaces/grpc_interfaces/validation_service_server"
	"google.golang.org/grpc/credentials"
	"log"
	"log/slog"
	"net"
	"os"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/grpc"

	"github.com/joho/godotenv"
	"go_server/infrastructure/repositories"
)

func main() {
	logFile, err := os.OpenFile("/home/super/logs/flashcard_server.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatalf("Не удалось открыть лог-файл: %v", err)
	}
	// Создаём хендлер
	handler := slog.NewTextHandler(logFile, &slog.HandlerOptions{
		Level: slog.LevelInfo, // можно сменить на Debug, Warn, Error
	})

	// Устанавливаем глобальный логгер
	logger := slog.New(handler)
	slog.SetDefault(logger)

	err = godotenv.Load()
	if err != nil {
		slog.Error("Error loading .env file")
		os.Exit(1)
	}

	accessTTL, err := time.ParseDuration(os.Getenv("ACCESS_TOKEN_TTL"))
	if err != nil {
		slog.Error("Error loading .env file")
		os.Exit(1)
	}
	refreshTTL, err := time.ParseDuration(os.Getenv("REFRESH_TOKEN_TTL"))
	if err != nil {
		slog.Error("Error loading .env file")
		os.Exit(1)
	}

	secretKey := os.Getenv("JWT_ACCESS_SECRET")
	refreshKey := os.Getenv("JWT_REFRESH_SECRET")

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	dsn := os.Getenv("DSN")
	dbpool, err := pgxpool.New(ctx, dsn)
	if err != nil {
		slog.Error("unable to connect to db: %v", err)
		os.Exit(1)
	}
	defer dbpool.Close()

	smtpSender := infrastructure.NewSmtpEmailSender(
		"smtp.yandex.ru", // или smtp.zoho.com, если ты не из Европы
		587,
		"maxim@flashystart.com", // логин
		"135790Max.",            // пароль
		"maxim@flashystart.com", // от кого
	)
	//smtpSender := infrastructure.NewSmtpEmailSender(
	//	"smtp.yandex.ru", // или smtp.zoho.com, если ты не из Европы
	//	465,
	//	"maxi.kholodov@yandex.com", // логин
	//	"btutxvoagnrmvbwx",         // пароль
	//	"maxi.kholodov@yandex.com", // от кого
	//)

	userRepo := repositories.NewPostgresUserRepository(dbpool)
	globalDeckRepo := repositories.NewPostgresGlobalDeckRepository(dbpool)
	deckPermissionRepo := repositories.NewDeckPermissionRepository(dbpool)
	globalCardRepo := repositories.NewPostgresGlobalCardRepository(dbpool)
	userDeckProgressRepo := repositories.NewPostgresUserDeckProgressRepository(dbpool)
	userProgressCardRepo := repositories.NewPostgresUserProgressCardRepository(dbpool)
	emailVerificationRepo := repositories.NewPostgresEmailVerificationRepository(dbpool)

	tokenService := token_services.NewTokenService(secretKey, refreshKey, accessTTL, refreshTTL, userRepo)
	globalDeckUseCases := global_deck_use_cases.NewGlobalDeckUseCases(dbpool, globalDeckRepo, deckPermissionRepo, tokenService, userRepo)
	userUseCases := user_use_cases.NewUserService(userRepo, emailVerificationRepo, smtpSender, *tokenService, globalCardRepo, globalDeckRepo, deckPermissionRepo)
	userProgressCardUseCases := user_progress_card_use_cases.NewUserProgressCardUseCases(dbpool, globalDeckRepo, deckPermissionRepo, tokenService, userDeckProgressRepo, userProgressCardRepo, globalCardRepo)
	globalCardUseCase := global_card_use_cases.NewGlobalCardUseCases(dbpool, globalCardRepo, deckPermissionRepo, tokenService, userRepo, globalDeckRepo)
	userDeckProgressUseCases := user_deck_progress_use_cases.NewUserDeckProgressUseCases(dbpool, globalDeckRepo, deckPermissionRepo, tokenService, userDeckProgressRepo, userProgressCardRepo)
	lis, err := net.Listen("tcp", ":8443")
	if err != nil {
		slog.Error("failed to listen: %v", err)
		os.Exit(1)
	}

	certFile := "/etc/letsencrypt/live/flashystart.com/fullchain.pem"
	keyFile := "/etc/letsencrypt/live/flashystart.com/privkey.pem"

	creds, err := credentials.NewServerTLSFromFile(certFile, keyFile)
	if err != nil {
		log.Fatalf("failed to load TLS credentials: %v", err)
	}

	grpcServer := grpc.NewServer(
		grpc.Creds(creds),
		grpc.UnaryInterceptor(interceptors.RecoveryAndLoggingUnaryInterceptor(logger)),
	)
	global_card_service_server.RegisterGlobalCardServiceServer(grpcServer, global_card_server.NewGlobalCardServiceServer(tokenService, globalCardUseCase))
	user_service_server.RegisterUserServiceServer(grpcServer, user_server.NewUserServiceServer(userUseCases, tokenService))
	auth_service_server.RegisterAuthServiceServer(grpcServer, auth_server.NewAuthServiceServer(userUseCases, tokenService))
	validation_service_server.RegisterValidationServiceServer(grpcServer, validation_server.NewValidationServiceServer(userUseCases))
	global_deck_service_server.RegisterGlobalDeckServiceServer(grpcServer, global_deck_server.NewGlobalDeckServiceServer(globalDeckUseCases, tokenService))
	user_deck_progress_service_server.RegisterUserDeckProgressServiceServer(grpcServer, user_deck_progress_server.NewUserDeckProgressServiceServerServiceServer(userDeckProgressUseCases, tokenService))
	user_progress_card_service_server.RegisterUserProgressCardServiceServer(grpcServer, user_progress_card_server.NewUserProgressCardServiceServer(userProgressCardUseCases, tokenService))
	slog.Info("Сервер запущен", "port", 8443)
	if err := grpcServer.Serve(lis); err != nil {
		slog.Error("failed to start server", slog.String("error", err.Error()))
		os.Exit(1)
	}
}
