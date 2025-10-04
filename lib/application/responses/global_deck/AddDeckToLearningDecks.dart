import '../../../domain/failures/failures.dart';

class AddDeckToLearningDecksResult{
  final bool? isSuccess;
  final Failure? failure;

   AddDeckToLearningDecksResult({
    this.isSuccess,
    this.failure
  });
}