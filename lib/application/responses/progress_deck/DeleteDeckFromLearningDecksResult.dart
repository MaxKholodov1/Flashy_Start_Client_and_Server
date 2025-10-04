import '../../../domain/failures/failures.dart';
class DeleteProgressDeckResult {
  final Failure? failure;
  final bool? isSuccess;
  DeleteProgressDeckResult({
    this.failure,
    this.isSuccess
  });
}
