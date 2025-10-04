
import '../../domain/entities/UserCardProgress.dart';
import '../../domain/failures/failures.dart';

class SubmitCardReviewResult {
  final List<UserProgressCard>? progressCards;
  final Failure? failure;
  SubmitCardReviewResult({
    this.progressCards,
    this.failure
  });
}