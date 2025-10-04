import '../../../domain/failures/failures.dart';

class DeleteGlobalCardResult {
  final Failure? failure;
  final bool? isSuccess;
  DeleteGlobalCardResult({
    this.failure,
    this.isSuccess
  });
}
