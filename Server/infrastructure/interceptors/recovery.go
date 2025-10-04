package interceptors

import (
	"context"
	"log/slog"
	"time"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func RecoveryAndLoggingUnaryInterceptor(logger *slog.Logger) grpc.UnaryServerInterceptor {
	return func(
		ctx context.Context,
		req interface{},
		info *grpc.UnaryServerInfo,
		handler grpc.UnaryHandler,
	) (resp interface{}, err error) {
		start := time.Now()

		defer func() {
			if r := recover(); r != nil {
				logger.Error("panic recovered",
					slog.String("method", info.FullMethod),
					slog.Any("panic", r),
				)
				err = status.Error(codes.Internal, "internal server error")
			}

			level := slog.LevelInfo
			if err != nil {
				level = slog.LevelError
			}

			logger.Log(ctx, level, "gRPC request",
				slog.String("method", info.FullMethod),
				slog.Duration("duration", time.Since(start)),
				slog.Any("error", err),
			)
		}()

		resp, err = handler(ctx, req)
		return
	}
}
