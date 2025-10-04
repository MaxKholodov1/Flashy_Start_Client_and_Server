
import '../../../domain/entities/GlobalCard.dart';
import '../../../domain/failures/failures.dart';

class GetGlobalCardsResult {
  final List<GlobalCard>? globalCards;
  final Failure? failure;
  GetGlobalCardsResult({
    this.globalCards,
    this.failure
  });
}