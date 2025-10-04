import '../../../domain/failures/failures.dart';

class UserPasswordAvailabilityResult {
  final bool isValid;
  final Failure? failure;

  const UserPasswordAvailabilityResult._({
    required this.isValid,
    this.failure,
  });

  /// Когда пароль валиден
  factory UserPasswordAvailabilityResult.success() {
    return const UserPasswordAvailabilityResult._(isValid: true);
  }

  /// Когда пароль невалиден по правилам
  factory UserPasswordAvailabilityResult.failure(Failure failure) {
    return UserPasswordAvailabilityResult._(isValid: false, failure: failure);
  }
}
