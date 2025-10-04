
import 'package:flashy_start/application/responses/global_card/GetGlobalCardsResult.dart';
import 'package:flashy_start/application/responses/global_card/UpdateGlobalCardResult.dart';

import '../../application/responses/global_card/CreateGlobalCardResult.dart';
import '../../application/responses/global_card/DeleteGlobalCardResult.dart';



abstract class GlobalCardRepository {
  Future<CreateGlobalCardResult> createGlobalCard({
    required String question,
    required String answer,
    required String accessToken,
    required int deckID
  });
  Future<GetGlobalCardsResult> getGlobalCardsByDeckID({
    required String accessToken,
    required int deckID,
  });
  Future<UpdateGlobalCardResult> updateGlobalCard({
    required String accessToken,
    required String question,
    required String answer,
    required int cardID,
    required int currentVersion,
  });
  Future<DeleteGlobalCardResult> deleteGlobalCard({
    required String accessToken,
    required int cardID,
  });
}
