import 'package:flashy_start/application/responses/progress_deck/GetProgressDecksResult.dart';
import 'package:flashy_start/domain/entities/UserDeckProgress.dart';

import '../../application/responses/progress_deck/DeleteDeckFromLearningDecksResult.dart';

abstract class UserDeckProgressRepository {
  Future<GetProgressDecksResult> getUserLearningProgressDecks({
    required String accessToken,
  });
  Future<GetProgressDecksResult> selectDecksForTodayReview({
    required String accessToken,
    required List<UserDeckProgress> progressDecks,
  });
  Future<DeleteProgressDeckResult> deleteDeckFromLearningDecks({
    required String accessToken,
    required int deckID,
  });
  List<UserDeckProgress>? getCache();
}
