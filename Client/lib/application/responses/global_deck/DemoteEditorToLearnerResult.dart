import '../../../domain/failures/failures.dart';

class DemoteEditorToLearnerResult{
  final bool? isSuccess;
  final Failure? failure;

  DemoteEditorToLearnerResult({
    this.isSuccess,
    this.failure
  });
}