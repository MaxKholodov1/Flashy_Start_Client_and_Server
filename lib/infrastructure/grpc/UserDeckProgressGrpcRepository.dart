import 'package:flashy_start/application/responses/progress_deck/DeleteDeckFromLearningDecksResult.dart';
import 'package:flashy_start/application/responses/progress_deck/GetProgressDecksResult.dart';
import 'package:flashy_start/domain/entities/UserDeckProgress.dart';
import 'package:flashy_start/infrastructure/grpc/UserDeckProgressClient.dart';

import '../../domain/repositories/UserDeckProgressRepository.dart';

class UserDeckProgressGrpcRepository implements UserDeckProgressRepository {
  List<UserDeckProgress>? learningProgressDecksCache;
  final UserDeckProgressClient userDeckProgressClient;
  UserDeckProgressGrpcRepository(this.userDeckProgressClient);
  @override
  Future<GetProgressDecksResult> getUserLearningProgressDecks({
    required String accessToken
  }) async {
    var res = await userDeckProgressClient.getUserLearningProgressDecks(accessToken: accessToken);
    learningProgressDecksCache = res.userDeckProgressList;
    return res;
  }
  @override
  Future<GetProgressDecksResult> selectDecksForTodayReview({
    required String accessToken,
    required List<UserDeckProgress> progressDecks,
  }) async {
    var res = await userDeckProgressClient.selectDecksForTodayReview(progressDecks: progressDecks, accessToken: accessToken);
    learningProgressDecksCache = res.userDeckProgressList;
    return res;
  }

  @override
  Future<DeleteProgressDeckResult> deleteDeckFromLearningDecks({
    required String accessToken,
    required int deckID,
  }) async {
    var res = await userDeckProgressClient.deleteDeckFromLearningDecks(deckID: deckID, accessToken: accessToken);
    return res;
  }
  List<UserDeckProgress>? getCache(){
    return learningProgressDecksCache;
  }
}
