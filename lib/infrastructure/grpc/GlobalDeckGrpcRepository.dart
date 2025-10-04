import 'package:flashy_start/application/responses/global_deck/DemoteEditorToLearnerResult.dart';
import 'package:flashy_start/application/responses/global_deck/GetGlobalDecksResult.dart';
import 'package:flashy_start/application/responses/global_deck/SearchGlobalDecksResult.dart';
import 'package:flashy_start/infrastructure/grpc/GlobalDeckClient.dart';

import '../../application/responses/global_deck/AddDeckToLearningDecks.dart';
import '../../application/responses/global_deck/AddEditorToGlobalDeck.dart';
import '../../application/responses/global_deck/CreateGlobalDeckResult.dart';
import '../../application/responses/global_deck/GetGlobalDeckInfoResult.dart';
import '../../application/responses/global_deck/UpdateGlobalDeckResult.dart';
import '../../domain/entities/GlobalDeck.dart';
import '../../domain/repositories/GlobalDeckRepository.dart';

class GlobalDeckGrpcRepository implements GlobalDeckRepository {
  List<searchResultDeck>? editableGlobalDecksCache;
  final GlobalDeckClient globalDeckClient;
  GlobalDeckGrpcRepository(this.globalDeckClient);
  @override
 Future<CreateGlobalDeckResult> createGlobalDeck({
    required String title,
    required String accessToken,
    required bool isPublic,
    String? description
  }){
    return globalDeckClient.createGlobalDeck(
        title: title,
        isPublic: isPublic,
        accessToken: accessToken,
        description: description
    );
  }

  @override
  Future<GetGlobalDecksResult> getEditableGlobalDecks({ required String accessToken}) async {
    var editableGlobalDecks = await  globalDeckClient.getEditableGlobalDecks(accessToken: accessToken);
    editableGlobalDecksCache = editableGlobalDecks.globalDecks;
    return editableGlobalDecks;
  }

  @override
  List<searchResultDeck>? getEditableGlobalDecksCache() {
    return editableGlobalDecksCache;
  }
  @override
  Future<UpdateGlobalDeckResult> updateGlobalDeck({required String accessToken, required searchResultDeck globalDeck}) async {
    var updateGlobalDeckResult = await globalDeckClient.updateGlobalDeck(accessToken: accessToken, globalDeck: globalDeck);
    return updateGlobalDeckResult;
  }
  @override
  Future<GetGlobalDeckInfoResult> getGlobalDeckByID({ required String accessToken, required int ID}) async {
    var res = await  globalDeckClient.getGlobalDeckByID(accessToken: accessToken, ID: ID);
    return res;
  }
  @override
  Future<bool> deleteGlobalDeck({required String accessToken, required int deckID}) {
    return globalDeckClient.deleteGlobalDeck(accessToken: accessToken, deckID: deckID);
  }
  @override
  Future<SearchGlobalDecksResult>  searchGlobalDecks ({ required String accessToken,
  required int offset, required int limit, required String query
  }){
    return globalDeckClient.searchGlobalDecks(accessToken: accessToken, query: query, offset: offset, limit: limit);
  }
  @override
  Future<AddDeckToLearningDecksResult> addDeckToLearningDecks({
    required String accessToken,
    required int deckID
  }){
    return globalDeckClient.addDeckToLearningDecks(
        accessToken: accessToken,
        deckID: deckID
    );
  }
  @override
  Future<AddEditorToGlobalDeckResult> addEditorToGlobalDeck({required String accessToken,
    required int deckID, required String userName}){
    return globalDeckClient.addEditorToGlobalDeck(accessToken: accessToken, deckID: deckID, userName: userName);
  }
  @override
  Future<DemoteEditorToLearnerResult> demoteEditorToLearner({required String accessToken,
    required int deckID, required String userName}){
    return globalDeckClient.demoteEditorToLearner(accessToken: accessToken, deckID: deckID, userName: userName);
  }
}
