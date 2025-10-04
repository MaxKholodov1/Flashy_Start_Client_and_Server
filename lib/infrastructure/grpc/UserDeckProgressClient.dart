import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/progress_deck/DeleteDeckFromLearningDecksResult.dart';
import 'package:flashy_start/application/responses/progress_deck/GetProgressDecksResult.dart';
import 'package:flashy_start/domain/entities/UserDeckProgress.dart';
import 'package:flashy_start/generated/user_deck_progress/user_deck_progress.pbgrpc.dart' as generated;

import 'mappers/userDeckProgressList.dart';

class UserDeckProgressClient {
  final generated.UserDeckProgressServiceClient stub;
  UserDeckProgressClient(ClientChannel channel) : stub = generated.UserDeckProgressServiceClient(channel);
  Future<GetProgressDecksResult> getUserLearningProgressDecks({
    required String accessToken,
  }) async{
    final request = generated.GetUserLearningProgressDecksRequest();
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.getUserLearningProgressDecks(request, options: callOptions);
    return GetProgressDecksResult(userDeckProgressList: mapProtoUserDeckProgressToDomain(response.userDeckProgressList));
  }
  Future<GetProgressDecksResult> selectDecksForTodayReview({
    required String accessToken,
    required List<UserDeckProgress> progressDecks,
  }) async{
    final request = generated.UserProgressDecks()..userProgressDecks.addAll(mapDomainUserDeckProgressToProto(progressDecks));
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.selectDecksForTodayReview(request, options: callOptions);
    return GetProgressDecksResult(userDeckProgressList: mapProtoUserDeckProgressToDomain(response.userProgressDecks));
  }
  Future<DeleteProgressDeckResult> deleteDeckFromLearningDecks({
    required String accessToken,
    required int deckID,
  }) async{
    final request = generated.DeleteDeckFromLearningDecksRequest()..deckId= deckID;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.deleteDeckFromLearningDecks(request, options: callOptions);
    return DeleteProgressDeckResult(isSuccess: response.isSuccess);
  }
}
