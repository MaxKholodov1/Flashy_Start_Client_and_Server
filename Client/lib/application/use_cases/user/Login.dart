import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/LoginResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../../domain/repositories/UserRepository.dart';

class Login {
  final UserRepository _repository;
  final SecureStorageService storage;
  Login(this._repository, this.storage);
  Future<LoginResult> call({
    required String identifier,
    required String password,
  }) async {
    try {
       LoginResult res = await _repository.login(
        identifier: identifier,
        password: password,
      );
       if (res.isEmailVerified == true){
       await storage.write( 'access_token', res.accessToken!);
       await storage.write('refresh_token', res.refreshToken!);
       }
       if (res.isEmailVerified == false){
         return LoginResult(failure: EmailVerificationFailure(res.userID));
       }
      return res;
    }catch(e){
      if (e is GrpcError && e.code == StatusCode.unavailable){
        return LoginResult(failure: NetworkFailure());
      }else if (e is GrpcError && e.code == StatusCode.unauthenticated){
        return LoginResult(failure: IncorrectPasswordFailure(e.message!));
      }else if (e is GrpcError && e.code == StatusCode.notFound){
        return LoginResult(failure: UserNotFoundFailure(e.message!));
      }else {
        return LoginResult(failure: UnknownFailure());
      }
    }
  }
}
