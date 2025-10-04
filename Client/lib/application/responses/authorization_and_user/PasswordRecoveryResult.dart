import '../../../domain/failures/failures.dart';

class PasswordRecoveryResult {
  final bool? isSuccess;
  final Failure? failure;
  const PasswordRecoveryResult({
    this.failure,
    this.isSuccess,
  });
}