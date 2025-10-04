import '../../../domain/failures/failures.dart';

class AddEditorToGlobalDeckResult{
  final bool? isSuccess;
  final Failure? failure;

  AddEditorToGlobalDeckResult({
    this.isSuccess,
    this.failure
  });
}