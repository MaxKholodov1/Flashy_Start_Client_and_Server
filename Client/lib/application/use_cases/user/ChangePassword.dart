import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/ChangePasswordResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../GrpcCallerWithRetry.dart';
class ChangePassword {
  final UserRepository userRepository;
  final SecureStorageService storage;
  late final GrpcCallerWithRetry grpcHelper;

  ChangePassword(this.storage, this.userRepository) {
    grpcHelper = GrpcCallerWithRetry(userRepository, storage);
  }

  Future<ChangePasswordResult> change({
    required String password,
    required String newPassword,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final result = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => userRepository.changePassword(
            accessToken: token,
            password: password,
            newPassword: newPassword,
        ),
      );
      if (result.isSuccess == false){
        return ChangePasswordResult(failure: UnknownFailure());
      }
      if (result.refreshToken == null){
        return ChangePasswordResult(failure: UnknownFailure());
      }
      storage.write("refresh_token", result.refreshToken!);
      if (result.accessToken != null){
        storage.write("access_token", result.accessToken!);
      }
      storage.write("access_token", "  ");
      return result;
    } catch (e) {
      if (e is GrpcError) {
        if (e.code == StatusCode.unavailable) {
          return ChangePasswordResult(failure: NetworkFailure());
        }
        else if (e.code == StatusCode.internal) {
          return ChangePasswordResult(failure: UnknownFailure());
        }else if (e.code == StatusCode.unauthenticated){
          return ChangePasswordResult(failure: AuthFailure(e.message!));
        }else if(e.code == StatusCode.permissionDenied){
          return ChangePasswordResult(failure: IncorrectPasswordFailure(e.message!));
        }
        return ChangePasswordResult(failure: UnknownFailure());
      } else if (e is Failure) {
        return ChangePasswordResult(failure: e);
      }
      return ChangePasswordResult(failure: UnknownFailure());
    }
  }
}
