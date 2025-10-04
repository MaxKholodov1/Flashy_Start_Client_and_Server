import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/UserNameAvailableResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';

import '../../../domain/repositories/UserRepository.dart';

class CheckUserNameAvailability {
  final UserRepository _repository;
  CheckUserNameAvailability(this._repository);
  Future<UserNameAvailabilityResult> call({
    required String userName,
  }) async {
    try {
      final result = await _repository.checkUserNameAvailability(
          userName: userName);
      return result;
    }catch (e){
      if (e is GrpcError && e.code == StatusCode.unavailable){
        return UserNameAvailabilityResult.failure(NetworkFailure());
      }else if (e is GrpcError && (e.code == StatusCode.invalidArgument || e.code == StatusCode.alreadyExists)){
        return UserNameAvailabilityResult.failure(UsernameValidationFailure(e.message!));
      }
    else{
        return UserNameAvailabilityResult.failure(UnknownFailure());
      }
    }
  }
}
