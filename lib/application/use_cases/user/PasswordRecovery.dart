import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/LoginResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/PasswordRecoveryResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../../domain/repositories/UserRepository.dart';

class PasswordRecovery {
  final UserRepository _repository;
  PasswordRecovery(this._repository);
  Future<PasswordRecoveryResult> call({
    required String usernameOrEmail,
  }) async {
    try {
      var res = await _repository.passwordRecovery(
        usernameOrEmail: usernameOrEmail
      );
      return res;
    }catch(e){
      if (e is GrpcError && e.code == StatusCode.unavailable){
        return PasswordRecoveryResult(failure: NetworkFailure());
      }else if (e is GrpcError && e.code == StatusCode.unauthenticated){
        return PasswordRecoveryResult(failure: IncorrectPasswordFailure(e.message!));
      }else if (e is GrpcError && e.code == StatusCode.notFound){
        return PasswordRecoveryResult(failure: UserNotFoundFailure(e.message!));
      }else {
        return PasswordRecoveryResult(failure: UnknownFailure());
      }
    }
  }
}
