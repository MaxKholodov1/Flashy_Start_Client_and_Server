import '../../../domain/failures/failures.dart';

class DeleteUserResult {
  final bool? isSuccess;
  final Failure? failure;
  const DeleteUserResult({
    this.failure,
    this.isSuccess,
  });
}