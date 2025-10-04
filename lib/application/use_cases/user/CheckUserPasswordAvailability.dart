import 'package:grpc/grpc.dart';

import '../../../domain/failures/failures.dart';
import '../../responses/authorization_and_user/UserPasswordAvailableResult.dart';
import '../../../domain/repositories/UserRepository.dart';

class CheckUserPasswordAvailability {
  final UserRepository _repository;
  CheckUserPasswordAvailability(this._repository);
  Future<UserPasswordAvailabilityResult> call({
    required String password,
  }) async {
    try {
      final result = await _repository.checkUserPasswordAvailability(
          password: password);
      return result;
    }catch(e){
      if (e is GrpcError && e.code == StatusCode.unavailable) {
        return UserPasswordAvailabilityResult.failure(NetworkFailure());
      }
      if (e is GrpcError && e.code == StatusCode.invalidArgument) {
        return UserPasswordAvailabilityResult.failure(PasswordValidationFailure(e.message!));
      }
      return UserPasswordAvailabilityResult.failure(UnknownFailure());
    }
  }
}
