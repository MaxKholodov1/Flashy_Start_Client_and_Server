import '../../../domain/failures/failures.dart';

class UserNameAvailabilityResult {
  final bool isAvailable;
  final Failure? failure;

  const UserNameAvailabilityResult._({
    required this.isAvailable,
    this.failure,
  });

  /// Когда имя доступно и без ошибок
  factory UserNameAvailabilityResult.success() {
    return const UserNameAvailabilityResult._(isAvailable: true);
  }

  /// Когда имя занято (валидно, но уже используется)
  factory UserNameAvailabilityResult.taken() {
    return const UserNameAvailabilityResult._(isAvailable: false);
  }

  /// Когда произошла ошибка (например, сеть, валидация)
  factory UserNameAvailabilityResult.failure(Failure failure) {
    return UserNameAvailabilityResult._(isAvailable: false, failure: failure);
  }
}
