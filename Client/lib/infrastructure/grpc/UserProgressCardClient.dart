import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/GetProgressCardsResult.dart';
import 'package:flashy_start/application/responses/SubmitCardReviewResult.dart';
import 'package:flashy_start/domain/entities/RecallQualityEnum.dart';
import 'package:flashy_start/domain/entities/UserCardProgress.dart';
import '../../generated/user_progress_card/user_progress_card.pbgrpc.dart' as generated;
import 'mappers/userProgressCard.dart';

class UserProgressCardClient {
  final generated.UserProgressCardServiceClient stub;
  UserProgressCardClient(ClientChannel channel) : stub = generated.UserProgressCardServiceClient(channel);
  Future<GetProgressCardsResult> getProgressCardsByDeckID({
    required String accessToken,
    required int deckID
  }) async{
    final request = generated.GetProgressCardsByDeckIDRequest()..deckID = deckID;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.getProgressCardsByDeckID(request, options: callOptions);
    return GetProgressCardsResult(progressCards: mapProtoToDomainUserProgressCards(response.progressCards));
  }
  Future<SubmitCardReviewResult> submitCardReview({
    required String accessToken,
    required List<UserProgressCard> progressCards,
    required RecallQuality quality,
  }) async{
    final request = generated.CardReviewRequest()
      ..cards.addAll(mapDomainToProtoUserProgressCards(progressCards))
    ..quality = mapDomainToProtoRecallQuality(quality);
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.submitProgressCardReview(request, options: callOptions);
    return SubmitCardReviewResult(progressCards: mapProtoToDomainUserProgressCards(response.cards));
  }
  Future<GetProgressCardsResult> selectNewProgressCards({
    required String accessToken,
    required List<UserProgressCard> progressCards,
  }) async{
    final request = generated.ProgressCards()
      ..cards.addAll(mapDomainToProtoUserProgressCards(progressCards));
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.selectNewProgressCards(request, options: callOptions);
    return GetProgressCardsResult(progressCards: mapProtoToDomainUserProgressCards(response.cards));
  }
  Future<GetProgressCardsResult> selectFamiliarProgressCards({
    required String accessToken,
    required List<UserProgressCard> progressCards,
  }) async{
    final request = generated.ProgressCards()
      ..cards.addAll(mapDomainToProtoUserProgressCards(progressCards));
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.selectFamiliarProgressCards(request, options: callOptions);
    return GetProgressCardsResult(progressCards: mapProtoToDomainUserProgressCards(response.cards));
  }
  Future<GetProgressCardsResult> getCardsForTodayReview({
    required String accessToken,
    required int deckID,
  }) async{
    final request = generated.GetCardsForTodayReviewRequest()
      ..deckId = deckID;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.getCardsForTodayReview(request, options: callOptions);
    return GetProgressCardsResult(progressCards: mapProtoToDomainUserProgressCards(response.cards));
  }
}
