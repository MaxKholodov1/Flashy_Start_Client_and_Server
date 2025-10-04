
import '../../domain/entities/UserCardProgress.dart';
import '../../domain/failures/failures.dart';

class GetProgressCardsResult {
  final List<UserProgressCard>? progressCards;
  final Failure? failure;
  GetProgressCardsResult({
    this.progressCards,
    this.failure
  });
}