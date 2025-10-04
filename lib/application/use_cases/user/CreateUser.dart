
import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/CreateUserResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../../domain/repositories/UserRepository.dart';

class CreateUser {
  final UserRepository _repository;
  final SecureStorageService storage;

  CreateUser(this._repository, this.storage);

  Future<CreateUserResult> call({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      var res = await _repository.createUser(
        userName: userName,
        email: email,
        password: password,
      );
      return res;
    }catch (e){
      if (e is GrpcError){
        if (e.code == StatusCode.unavailable){
          return CreateUserResult(failure: NetworkFailure());
        }else if (e.code == StatusCode.invalidArgument){
          return CreateUserResult(failure: CreateUserInvalidArgumentFailure(e.message!));
        }else if(e.code == StatusCode.alreadyExists){
          return CreateUserResult(failure:UserAlreadyExistsFailure(e.message!));
        }else if (e.code == StatusCode.failedPrecondition){
          return CreateUserResult(failure: EmailVerificationFailure(null));
        }
        else{
          return CreateUserResult(failure: UnknownFailure());
        }
      }else {
        return CreateUserResult(failure: UnknownFailure());
      }
    }
  }
  Future<CreateDefUserResult> callDef() async {
    try {
      var res = await _repository.createDefUser();
      print("вот тут");
      print(res.access_token);
      if (res.isSuccess == false){
        return CreateDefUserResult(failure: UnknownFailure());
      }
      await storage.write( 'access_token', res.access_token!);
      await storage.write('refresh_token', res.refresh_token!);
      return res;
    }catch (e){
      if (e is GrpcError){
        print(e.message!);
        if (e.code == StatusCode.unavailable){
          return CreateDefUserResult(failure: NetworkFailure());
        }else if (e.code == StatusCode.invalidArgument){
          return CreateDefUserResult(failure: CreateUserInvalidArgumentFailure(e.message!));
        }else if(e.code == StatusCode.alreadyExists){
          return CreateDefUserResult(failure:UserAlreadyExistsFailure(e.message!));
        }else if (e.code == StatusCode.failedPrecondition){
          return CreateDefUserResult(failure: EmailVerificationFailure(null));
        }
        else{
          return CreateDefUserResult(failure: UnknownFailure());
        }
      }else {
        return CreateDefUserResult(failure: UnknownFailure());
      }
    }
  }
}
