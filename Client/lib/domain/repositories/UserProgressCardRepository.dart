import '../../application/responses/GetProgressCardsResult.dart';
import '../../application/responses/SubmitCardReviewResult.dart';
import '../entities/RecallQualityEnum.dart';
import '../entities/UserCardProgress.dart';

abstract class UserProgressCardRepository {
  Future<GetProgressCardsResult> getProgressCardsByDeckID({
    required String accessToken,
    required int deckID,
  });
  Future<SubmitCardReviewResult> submitCardReview({
    required RecallQuality recallQuality,
    required String accessToken,
    required List<UserProgressCard> progressCards
  });
  Future<GetProgressCardsResult> selectNewProgressCards({
    required String accessToken,
    required List<UserProgressCard> progressCards
  });
  Future<GetProgressCardsResult> selectFamiliarProgressCards({
    required String accessToken,
    required List<UserProgressCard> progressCards
  });
  Future<GetProgressCardsResult> getProgressCardsForTodayReview({
    required String accessToken,
    required int deckID,
  });
}
