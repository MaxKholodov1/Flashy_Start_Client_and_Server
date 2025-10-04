import 'package:flashy_start/application/responses/global_deck/AddDeckToLearningDecks.dart';
import 'package:flashy_start/application/responses/global_deck/AddEditorToGlobalDeck.dart';
import 'package:flashy_start/application/responses/global_deck/CreateGlobalDeckResult.dart';
import 'package:flashy_start/application/responses/global_deck/GetGlobalDecksResult.dart';

import '../../application/responses/global_deck/DemoteEditorToLearnerResult.dart';
import '../../application/responses/global_deck/GetGlobalDeckInfoResult.dart';
import '../../application/responses/global_deck/SearchGlobalDecksResult.dart';
import '../../application/responses/global_deck/UpdateGlobalDeckResult.dart';
import '../entities/GlobalDeck.dart';


abstract class GlobalDeckRepository {
  Future<GetGlobalDecksResult> getEditableGlobalDecks({ required String accessToken});
  Future<GetGlobalDeckInfoResult> getGlobalDeckByID({ required String accessToken, required int ID});
  List<searchResultDeck>? getEditableGlobalDecksCache();
  Future<UpdateGlobalDeckResult> updateGlobalDeck({required String accessToken,required searchResultDeck globalDeck });
  Future<CreateGlobalDeckResult> createGlobalDeck({
    required String title,
    required bool isPublic,
    required String accessToken,
    String? description,
  });
  Future<bool> deleteGlobalDeck({
    required String accessToken,
    required int deckID
  });
  Future<SearchGlobalDecksResult>  searchGlobalDecks ({ required String accessToken,
    required int offset, required int limit, required String query
  });
  Future<AddDeckToLearningDecksResult> addDeckToLearningDecks({required String accessToken,
  required int deckID});
  Future<AddEditorToGlobalDeckResult> addEditorToGlobalDeck({required String accessToken,
  required int deckID, required String userName});
  Future<DemoteEditorToLearnerResult> demoteEditorToLearner({required String accessToken,
    required int deckID, required String userName});
}
