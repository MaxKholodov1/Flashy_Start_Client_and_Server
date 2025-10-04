import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/UserEmailAvailableResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';

import '../../../domain/repositories/UserRepository.dart';

class CheckUserEmailAvailability {
  final UserRepository _repository;

  CheckUserEmailAvailability(this._repository);

  Future<UserEmailAvailabilityResult> call({
    required String userEmail,
  }) async {
    try {
      final result = await _repository.checkUserEmailAvailability(
        userEmail: userEmail,
      );
      return result;
    } catch (e) {
      if (e is GrpcError && e.code == StatusCode.unavailable) {
        return UserEmailAvailabilityResult.failure(NetworkFailure());
      } else if (e is GrpcError && (e.code == StatusCode.invalidArgument || e.code == StatusCode.alreadyExists)) {
        return UserEmailAvailabilityResult.failure(EmailValidationFailure(e.message!));
      } else {
        return UserEmailAvailabilityResult.failure(UnknownFailure());
      }
    }
  }
}
