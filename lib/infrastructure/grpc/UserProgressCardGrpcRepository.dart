
import 'package:flashy_start/application/responses/GetProgressCardsResult.dart';
import 'package:flashy_start/application/responses/SubmitCardReviewResult.dart';

import '../../domain/entities/RecallQualityEnum.dart';
import '../../domain/entities/UserCardProgress.dart';
import '../../domain/repositories/UserProgressCardRepository.dart';
import 'UserProgressCardClient.dart';

class UserProgressCardGrpcRepository implements UserProgressCardRepository {
  final UserProgressCardClient userProgressCardClient;
  UserProgressCardGrpcRepository(this.userProgressCardClient);
  @override
  Future<GetProgressCardsResult> getProgressCardsByDeckID({
    required int deckID,
    required String accessToken
  }) async {
    var res = await userProgressCardClient.getProgressCardsByDeckID(accessToken: accessToken, deckID: deckID);
    return res;
  }
  @override
  Future<SubmitCardReviewResult> submitCardReview({
    required RecallQuality recallQuality,
    required String accessToken,
    required List<UserProgressCard> progressCards
  }) async {
    var res = await userProgressCardClient.submitCardReview(accessToken: accessToken, progressCards: progressCards, quality: recallQuality);
    return res;
  }
  @override
  Future<GetProgressCardsResult> selectNewProgressCards({
    required String accessToken,
    required List<UserProgressCard> progressCards
  }) async {
    var res = await userProgressCardClient.selectNewProgressCards(accessToken: accessToken, progressCards: progressCards);
    return res;
  }
  @override
  Future<GetProgressCardsResult> selectFamiliarProgressCards({
    required String accessToken,
    required List<UserProgressCard> progressCards
  }) async {
    var res = await userProgressCardClient.selectFamiliarProgressCards(accessToken: accessToken, progressCards: progressCards);
    return res;
  }
  @override
  Future<GetProgressCardsResult> getProgressCardsForTodayReview({
    required String accessToken,
    required int deckID
  }) async {
    var res = await userProgressCardClient.getCardsForTodayReview(accessToken: accessToken, deckID: deckID);
    return res;
  }
}
