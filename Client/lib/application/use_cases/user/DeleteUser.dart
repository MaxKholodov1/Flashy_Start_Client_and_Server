import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/DeleteUser.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';

class DeleteUser{
  final UserRepository userRepository;
  final SecureStorageService storage;
  late final GrpcCallerWithRetry grpcHelper;

  DeleteUser(this.storage, this.userRepository) {
    grpcHelper = GrpcCallerWithRetry(userRepository, storage);
  }
  Future<DeleteUserResult> delete() async{
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final result = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => userRepository.deleteUser(
            accessToken: token,
        ),
      );
      return result;
    } catch (e) {
      if (e is GrpcError) {
        if (e.code == StatusCode.unavailable) {
          return DeleteUserResult(failure: NetworkFailure());
        } else if (e.code == StatusCode.internal) {
          return DeleteUserResult(failure: UnknownFailure());
        }else if (e.code == StatusCode.unauthenticated){
          return DeleteUserResult(failure: AuthFailure(e.message!));
        }
        return DeleteUserResult(failure: UnknownFailure());
      } else if (e is Failure) {
        return DeleteUserResult(failure: e);
      }
      return DeleteUserResult(failure: UnknownFailure());
    }
  }
}