import '../../../domain/failures/failures.dart';

class DeleteGlobalDeckResult {
  final Failure? failure;
  final bool? isSuccess;
   DeleteGlobalDeckResult({
    this.failure,
    this.isSuccess
  });
}
