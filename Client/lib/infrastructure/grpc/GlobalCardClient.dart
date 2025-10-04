import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/global_card/GetGlobalCardsResult.dart';
import 'package:flashy_start/infrastructure/grpc/mappers/GlobalCardMapper.dart';
import '../../application/responses/global_card/CreateGlobalCardResult.dart';
import '../../application/responses/global_card/DeleteGlobalCardResult.dart';
import '../../application/responses/global_card/UpdateGlobalCardResult.dart';
import '../../generated/global_card/global_card.pbgrpc.dart' as generated;

class GlobalCardClient {
  final generated.GlobalCardServiceClient stub;
  GlobalCardClient(ClientChannel channel) : stub = generated.GlobalCardServiceClient(channel);
  Future<CreateGlobalCardResult> createGlobalCard({
    required String question,
    required String answer,
    required String accessToken,
    required int deckID,
  }) async{
    final request = generated.CreateGlobalCardRequest()
      ..question = question
    ..answer = answer
    ..deckID = deckID;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.createGlobalCard(request, options: callOptions);
    return CreateGlobalCardResult(globalCardID: response.id);
  }
  Future<GetGlobalCardsResult> getGlobalCardsByDeckID({required int deckID,
    required String accessToken}) async{
    final request = generated.GetGlobalCardsByDeckIDRequest()..deckID = deckID;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.getGlobalCardsByDeckID(request, options: callOptions);
    return GetGlobalCardsResult(globalCards: mapProtoGlobalCardsToDomain(response.globalCards));
  }
  Future<UpdateGlobalCardResult> updateGlobalCard({required int cardID, required int currentVersion,
  required String accessToken, required String question, required String answer}) async{
    final request = generated.UpdateGlobalCardRequest()
      ..answer = answer
        ..question = question
        ..version = currentVersion
        ..cardID = cardID;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.updateGlobalCard(request, options: callOptions);
    return UpdateGlobalCardResult(conflictCard: mapProtoGlobalCardToDomain(response.conflictCard), isSuccess: response.isSuccess);
  }
  Future<DeleteGlobalCardResult> deleteGlobalCard({required int cardID, required String accessToken}) async{
    final request = generated.DeleteGlobalCardRequest()
      ..cardId = cardID;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.deleteGlobalCard(request, options: callOptions);
    return DeleteGlobalCardResult( isSuccess: response.isSuccess);
  }
}
