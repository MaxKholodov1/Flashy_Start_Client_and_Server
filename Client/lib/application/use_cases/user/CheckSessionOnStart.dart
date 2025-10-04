
import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/CheckSessionOnStartResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/RefreshTokenResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';

import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
String grpcStatusCodeToString(int code) {
  switch (code) {
    case StatusCode.ok: return 'OK';
    case StatusCode.cancelled: return 'Cancelled';
    case StatusCode.unknown: return 'Unknown';
    case StatusCode.invalidArgument: return 'InvalidArgument';
    case StatusCode.deadlineExceeded: return 'DeadlineExceeded';
    case StatusCode.notFound: return 'NotFound';
    case StatusCode.alreadyExists: return 'AlreadyExists';
    case StatusCode.permissionDenied: return 'PermissionDenied';
    case StatusCode.resourceExhausted: return 'ResourceExhausted';
    case StatusCode.failedPrecondition: return 'FailedPrecondition';
    case StatusCode.aborted: return 'Aborted';
    case StatusCode.outOfRange: return 'OutOfRange';
    case StatusCode.unimplemented: return 'Unimplemented';
    case StatusCode.internal: return 'Internal';
    case StatusCode.unavailable: return 'Unavailable';
    case StatusCode.dataLoss: return 'DataLoss';
    case StatusCode.unauthenticated: return 'Unauthenticated';
    default: return 'UnknownCode($code)';
  }
}

class CheckSessionOnStart {
  final UserRepository _repository;
  CheckSessionOnStart(this._repository);
  Future<CheckSessionOnStartResult> call({
    required SecureStorageService storage,
  }) async {
    final refreshToken = await storage.read("refresh_token");
    if (refreshToken == null){
      return CheckSessionOnStartResult.isActive(false, null);
    }
    try{
      RefreshTokenResult result = await  _repository.refreshToken(refreshToken: refreshToken);
      await storage.write("refresh_token", result.refreshToken!);
      await storage.write("access_token", result.accessToken);
      return CheckSessionOnStartResult.isActive(true, result.userID!);
    }catch(e) {
       if (e is GrpcError && e.code == StatusCode.unauthenticated) {
        return CheckSessionOnStartResult.isActive(false, null);
      }
      else {
        return CheckSessionOnStartResult.failure(UnknownFailure());
      }
    }
  }
}
