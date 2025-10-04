import 'package:grpc/grpc.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';

typedef GrpcCall<T> = Future<T> Function(String accessToken);

class GrpcCallerWithRetry {
  final UserRepository userRepository;
  final SecureStorageService storage;

  GrpcCallerWithRetry(this.userRepository, this.storage);

  Future<T> callWithTokenRetry<T>({
    required String accessToken,
    required GrpcCall<T> call,
  }) async {
    try {
      return await call(accessToken);
    } catch (e) {
      if (e is GrpcError && e.code == StatusCode.unauthenticated) {
        final refreshToken = await storage.read("refresh_token");
        if (refreshToken == null) {
          throw AuthFailure("No refresh token found");
        }

        // Обновляем токены
        final result = await userRepository.refreshToken(refreshToken: refreshToken);
        await storage.write("refresh_token", result.refreshToken!);
        await storage.write("access_token", result.accessToken);

        // Повторяем вызов с новым токеном
        return await call(result.accessToken);
      }

      rethrow; // Пробрасываем другие ошибки
    }
  }
}
