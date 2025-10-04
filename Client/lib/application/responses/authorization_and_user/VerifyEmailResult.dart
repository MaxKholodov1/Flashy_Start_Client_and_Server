import '../../../domain/failures/failures.dart';

class VerifyEmailResult {
  final bool? isSuccess;
  final String? accessToken;
  final String? refreshToken;
  final Failure? failure;
  const VerifyEmailResult({
    this.isSuccess,
    this.accessToken,
    this.refreshToken,
    this.failure
  });
}