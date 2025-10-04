
import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/SendVerificationCode.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../../responses/authorization_and_user/VerifyEmailResult.dart';

class EmailUseCases {
  final UserRepository _repository;
  final SecureStorageService storage;
  EmailUseCases(this._repository, this.storage);
  Future<VerifyEmailResult> verify({
    required int userID,
    required String code,
  }) async {
    try {
      VerifyEmailResult res = await _repository.verifyEmail(
        userID: userID,
        code: code,
      );
      if (res.isSuccess == false){
        return VerifyEmailResult(failure: EmailVerificationInvalidCode());
      }
      await storage.write( 'access_token', res.accessToken!);
      await storage.write('refresh_token', res.refreshToken!);
      return res;
    }catch(e){
      if (e is GrpcError && e.code == StatusCode.unavailable) {
        return VerifyEmailResult(failure: NetworkFailure());
      }else {
        return VerifyEmailResult(failure: UnknownFailure());
      }
    }
  }

  Future<SendVerificationCodeResult> send({
    required int userID,
  }) async {
    try {
      SendVerificationCodeResult res = await _repository.sendVerificationCode(
        userID: userID,
      );
      if (res.isSuccess == false){
        return SendVerificationCodeResult(failure: EmailVerificationInvalidCode());
      }
      return res;
    }catch(e){
      if (e is GrpcError && e.code == StatusCode.unavailable) {
        return SendVerificationCodeResult(failure: NetworkFailure());
      }else {
        return SendVerificationCodeResult(failure: UnknownFailure());
      }
    }
  }
}
