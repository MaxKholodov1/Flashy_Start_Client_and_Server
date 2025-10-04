import '../../../domain/failures/failures.dart';

class SendVerificationCodeResult {
  final bool? isSuccess;
  final Failure? failure;
  const SendVerificationCodeResult({
    this.isSuccess,
    this.failure
  });
}