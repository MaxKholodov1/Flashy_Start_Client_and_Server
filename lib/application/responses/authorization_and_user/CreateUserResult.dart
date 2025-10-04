import 'package:flashy_start/domain/failures/failures.dart';

class CreateUserResult {
  final Failure? failure;
  final int? userID;

  const CreateUserResult({
    this.failure,
    this.userID
  });

  bool get isSuccess => failure == null;
}
class CreateDefUserResult {
  final Failure? failure;
  final int? userID;
  final String? access_token;
  final String? refresh_token;

  const CreateDefUserResult({
    this.failure,
    this.userID,
    this.access_token,
    this.refresh_token,
  });

  bool get isSuccess => failure == null;
}
