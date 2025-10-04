import 'package:flashy_start/application/responses/global_card/CreateGlobalCardResult.dart';
import 'package:flashy_start/application/responses/global_card/GetGlobalCardsResult.dart';
import 'package:flashy_start/application/responses/global_card/UpdateGlobalCardResult.dart';
import '../../application/responses/global_card/DeleteGlobalCardResult.dart';
import '../../domain/repositories/GlobalCardRepository.dart';
import 'GlobalCardClient.dart';

class GlobalCardGrpcRepository implements GlobalCardRepository {
  final GlobalCardClient globalCardClient;
  GlobalCardGrpcRepository(this.globalCardClient);
  @override
  Future<CreateGlobalCardResult> createGlobalCard({
    required String question,
    required String accessToken,
    required String answer,
    required int deckID
  }){
    return globalCardClient.createGlobalCard(
      question: question,
      accessToken: accessToken,
      answer: answer,
      deckID: deckID
    );
  }
  @override
  Future<GetGlobalCardsResult> getGlobalCardsByDeckID({
    required String accessToken,
    required int deckID
  }){

    return globalCardClient.getGlobalCardsByDeckID(
        accessToken: accessToken,
        deckID: deckID
    );
  }

  @override
  Future<UpdateGlobalCardResult> updateGlobalCard({
    required String accessToken,
    required int cardID,
    required String answer,
    required String question,
    required int currentVersion,
  }){
    return globalCardClient.updateGlobalCard(
        accessToken: accessToken,
        cardID: cardID,
      question: question,
      answer: answer,
      currentVersion: currentVersion
    );
  }
  @override
  Future<DeleteGlobalCardResult> deleteGlobalCard({
    required String accessToken,
    required int cardID
  }){

    return globalCardClient.deleteGlobalCard(
        accessToken: accessToken,
        cardID: cardID
    );
  }
}
