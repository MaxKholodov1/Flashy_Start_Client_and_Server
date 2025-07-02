package main

import (
	"context"
	"go_server/application/services/token_services"
	"go_server/application/use_cases/global_card_use_cases"
	"go_server/application/use_cases/global_deck_use_cases"
	"go_server/application/use_cases/user_deck_progress_use_cases"
	"go_server/application/use_cases/user_progress_card_use_cases"
	"go_server/application/use_cases/user_use_cases"
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
	"log"
	"net"
	"os"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/grpc"

	"github.com/joho/godotenv"
	"go_server/infrastructure/repositories"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	accessTTL, err := time.ParseDuration(os.Getenv("ACCESS_TOKEN_TTL"))
	if err != nil {
	}
	refreshTTL, err := time.ParseDuration(os.Getenv("REFRESH_TOKEN_TTL"))
	if err != nil {
	}

	secretKey := os.Getenv("JWT_ACCESS_SECRET")
	refreshKey := os.Getenv("JWT_REFRESH_SECRET")

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	dsn := os.Getenv("DSN")
	dbpool, err := pgxpool.New(ctx, dsn)
	if err != nil {
		log.Fatalf("unable to connect to db: %v", err)
	}
	defer dbpool.Close()

	userRepo := repositories.NewPostgresUserRepository(dbpool)
	globalDeckRepo := repositories.NewPostgresGlobalDeckRepository(dbpool)
	deckPermissionRepo := repositories.NewDeckPermissionRepository(dbpool)
	globalCardRepo := repositories.NewPostgresGlobalCardRepository(dbpool)
	userDeckProgressRepo := repositories.NewPostgresUserDeckProgressRepository(dbpool)
	userProgressCardRepo := repositories.NewPostgresUserProgressCardRepository(dbpool)

	tokenService := token_services.NewTokenService(secretKey, refreshKey, accessTTL, refreshTTL)
	globalDeckUseCases := global_deck_use_cases.NewGlobalDeckUseCases(dbpool, globalDeckRepo, deckPermissionRepo, tokenService, userRepo)
	userUseCases := user_use_cases.NewUserService(userRepo)
	userProgressCardUseCases := user_progress_card_use_cases.NewUserProgressCardUseCases(dbpool, globalDeckRepo, deckPermissionRepo, tokenService, userDeckProgressRepo, userProgressCardRepo, globalCardRepo)
	globalCardUseCase := global_card_use_cases.NewGlobalCardUseCases(dbpool, globalCardRepo, deckPermissionRepo, tokenService, userRepo, globalDeckRepo)
	userDeckProgressUseCases := user_deck_progress_use_cases.NewUserDeckProgressUseCases(dbpool, globalDeckRepo, deckPermissionRepo, tokenService, userDeckProgressRepo, userProgressCardRepo)
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(interceptors.RecoveryAndLoggingUnaryInterceptor),
	)
	global_card_service_server.RegisterGlobalCardServiceServer(grpcServer, global_card_server.NewGlobalCardServiceServer(tokenService, globalCardUseCase))
	user_service_server.RegisterUserServiceServer(grpcServer, user_server.NewUserServiceServer(userUseCases, tokenService))
	auth_service_server.RegisterAuthServiceServer(grpcServer, auth_server.NewAuthServiceServer(userUseCases, tokenService))
	validation_service_server.RegisterValidationServiceServer(grpcServer, validation_server.NewValidationServiceServer(userUseCases))
	global_deck_service_server.RegisterGlobalDeckServiceServer(grpcServer, global_deck_server.NewGlobalDeckServiceServer(globalDeckUseCases, tokenService))
	user_deck_progress_service_server.RegisterUserDeckProgressServiceServer(grpcServer, user_deck_progress_server.NewUserDeckProgressServiceServerServiceServer(userDeckProgressUseCases, tokenService))
	user_progress_card_service_server.RegisterUserProgressCardServiceServer(grpcServer, user_progress_card_server.NewUserProgressCardServiceServer(userProgressCardUseCases, tokenService))
	log.Println("gRPC server listening on :50051")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
