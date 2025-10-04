import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/GetUserResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../../domain/repositories/UserRepository.dart';
class GetUser {
  final UserRepository _repository;
  final SecureStorageService storage;
  GetUser(this._repository, this.storage);
  Future<GetUserResult> call() async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      GetUserResult res = await _repository.getUser(accessToken: accessToken);
      return res;
    }catch (e){
      if (e is GrpcError){
      }
      if (e is GrpcError && e.code == StatusCode.unauthenticated){
        String? refreshToken = await storage.read("refresh_token");
        if (refreshToken == null){
          return GetUserResult(failure: AuthFailure("there are no refresh token"));
        }
        try {
          var result = await _repository.refreshToken(refreshToken: refreshToken);
          await storage.write("refresh_token", result.refreshToken!);
          await storage.write("access_token", result.accessToken);
          try {
            final retry = await _repository.getUser(accessToken: result.accessToken);
            return retry;
          }catch(e){
            if(e is GrpcError){
              if (e.code == StatusCode.unauthenticated){
                return GetUserResult(failure: AuthFailure(e.message!));
              }else if (e.code == StatusCode.unavailable){
                return GetUserResult(failure: NetworkFailure());
              }else {
                return GetUserResult(failure: UnknownFailure());
              }
            }
          }
        }catch (e){
            if (e is GrpcError && e.code == StatusCode.unauthenticated){
              return GetUserResult(failure: AuthFailure(e.message!));
            }else if (e is GrpcError && e.code == StatusCode.unavailable){
              return GetUserResult(failure: NetworkFailure());
            }else{
              return GetUserResult(failure: UnknownFailure());
            }
        }
      }
      return GetUserResult(failure: UnknownFailure());
    }
  }
}
