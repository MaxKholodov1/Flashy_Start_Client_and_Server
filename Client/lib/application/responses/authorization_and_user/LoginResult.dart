import 'package:flashy_start/domain/failures/failures.dart';

class LoginResult {
  final bool? isPasswordCorrect;
  final String? accessToken;
  final String? refreshToken;
  final int? userID;
  final bool? isEmailVerified;
  final Failure? failure;
  const LoginResult({
    this.isPasswordCorrect,
    this.accessToken,
    this.refreshToken,
    this.userID,
    this.isEmailVerified,
    this.failure
  });
}