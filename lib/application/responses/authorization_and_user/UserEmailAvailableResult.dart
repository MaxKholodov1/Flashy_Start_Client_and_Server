import '../../../domain/failures/failures.dart';

class UserEmailAvailabilityResult {
  final bool isAvailable;
  final Failure? failure;

  const UserEmailAvailabilityResult._({
    required this.isAvailable,
    this.failure,
  });

  /// Когда email доступен и без ошибок
  factory UserEmailAvailabilityResult.success() {
    return const UserEmailAvailabilityResult._(isAvailable: true);
  }

  /// Когда email занят (валиден, но используется)
  factory UserEmailAvailabilityResult.taken() {
    return const UserEmailAvailabilityResult._(isAvailable: false);
  }

  /// Когда произошла ошибка (сеть, валидация и т.д.)
  factory UserEmailAvailabilityResult.failure(Failure failure) {
    return UserEmailAvailabilityResult._(isAvailable: false, failure: failure);
  }
}
