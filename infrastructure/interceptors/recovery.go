package interceptors

import (
	"context"
	"log"
	"time"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func RecoveryAndLoggingUnaryInterceptor(
	ctx context.Context,
	req interface{},
	info *grpc.UnaryServerInfo,
	handler grpc.UnaryHandler,
) (resp interface{}, err error) {
	start := time.Now()

	defer func() {
		if r := recover(); r != nil {
			log.Printf("[PANIC RECOVERED] method=%s panic=%v", info.FullMethod, r)
			err = status.Error(codes.Internal, "internal server error")
		}
		log.Printf("[gRPC] method=%s duration=%s err=%v", info.FullMethod, time.Since(start), err)
	}()

	resp, err = handler(ctx, req)
	return
}
