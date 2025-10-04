import '../../../domain/failures/failures.dart';

class ChangePasswordResult {
  final bool? isSuccess;
  final String? refreshToken;
  final String? accessToken;
  final Failure? failure;
  const ChangePasswordResult({
    this.failure,
    this.refreshToken,
    this.accessToken,
    this.isSuccess,
  });
}