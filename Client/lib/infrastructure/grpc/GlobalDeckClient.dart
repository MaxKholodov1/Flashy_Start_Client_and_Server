import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/global_deck/AddDeckToLearningDecks.dart';
import 'package:flashy_start/application/responses/global_deck/CreateGlobalDeckResult.dart';
import 'package:flashy_start/application/responses/global_deck/GetGlobalDeckInfoResult.dart';
import 'package:flashy_start/application/responses/global_deck/GetGlobalDecksResult.dart';
import 'package:flashy_start/application/responses/global_deck/SearchGlobalDecksResult.dart';
import 'package:flashy_start/domain/entities/GlobalDeck.dart' as domain;
import 'package:flashy_start/infrastructure/grpc/DateTimeToTimeStamp.dart';
import 'package:flashy_start/infrastructure/grpc/mappers/globalDeckMapper.dart';
import '../../application/responses/global_deck/AddEditorToGlobalDeck.dart';
import '../../application/responses/global_deck/DemoteEditorToLearnerResult.dart';
import '../../application/responses/global_deck/UpdateGlobalDeckResult.dart';
import '../../generated/global_deck/global_deck.pbgrpc.dart' as generated;
import 'mappers/searchResultDecks.dart';

class GlobalDeckClient {
  final generated.GlobalDeckServiceClient stub;
  GlobalDeckClient(ClientChannel channel) : stub = generated.GlobalDeckServiceClient(channel);
  Future<CreateGlobalDeckResult> createGlobalDeck({
    required String title,
    required bool isPublic,
    required String accessToken,
    String? description
  }) async{
    final request = generated.CreateGlobalDeckRequest()
  ..description = description ??= ""
  ..title = title
  ..isPublic = isPublic;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.createGlobalDeck(request, options: callOptions);
    return CreateGlobalDeckResult(globalDeckID: response.id);
  }
  Future<GetGlobalDecksResult> getEditableGlobalDecks({
    required String accessToken,
  }) async{
    final request = generated.GetEditableDecksRequest();
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.getEditableGlobalDecks(request, options: callOptions);
    final List<domain.searchResultDeck> domainDecks = response.listOfGlobalDecks.map((d) => d.toDomain()).toList();
    return GetGlobalDecksResult(globalDecks: domainDecks);
  }
  Future<UpdateGlobalDeckResult> updateGlobalDeck({
    required String accessToken,
    required domain.searchResultDeck globalDeck,
  }) async {
    final request = generated.UpdateGlobalDeckRequest()
        ..globalDeck = generated.GlobalDeck(
          id: globalDeck.ID,
          title: globalDeck.title,
          description: globalDeck.description,
          authorID: globalDeck.authorID,
          isPublic: globalDeck.isPublic,
          updatedAt: dateTimeToTimestamp(globalDeck.updatedAt) ,
          createdAt: dateTimeToTimestamp(globalDeck.createdAt),
          tags: globalDeck.tags,
          version: globalDeck.version
        );
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.updateGlobalDeck(request, options: callOptions);
    if (response.isSuccess == false){
      return UpdateGlobalDeckResult(isSuccess: false, conflictDeck: response.conflictDeck.toDomain());
    }
    return UpdateGlobalDeckResult(isSuccess: true);
  }
  Future<GetGlobalDeckInfoResult> getGlobalDeckByID({
    required String accessToken,
    required int ID,
  }) async{
    final request = generated.GetGlobalDeckInfoByIDRequest(id: ID);
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.getGlobalDeckInfoByID(request, options: callOptions);
    final domain.searchResultDeck domainDeck = response.globalDeck.toDomain();
    return GetGlobalDeckInfoResult(globalDeck: domainDeck, authorName: response.authName, editorNames: response.editorNames);
  }
  Future<bool> deleteGlobalDeck({
    required String accessToken,
    required int deckID
  }) async {
    final request = generated.DeleteGlobalDeckRequest(deckID: deckID);
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.deleteGlobalDeck(request, options: callOptions);
    return response.isSuccess;
  }
  Future<SearchGlobalDecksResult> searchGlobalDecks({
    required String accessToken,
    required String query,
    required int offset,
    required int limit,
  })async {
    final request = generated.SearchGlobalDecksRequest(query: query, limit: limit, offset: offset);
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.searchGlobalDecks(request, options: callOptions);
    return SearchGlobalDecksResult(searchResultDecks: mapToDomainList(response), hasMore: response.hasMore) ;
  }
  Future<AddDeckToLearningDecksResult> addDeckToLearningDecks ({
    required String accessToken,
    required int deckID,
  }) async{
    final request = generated.AddDeckToLearningDecksRequest(deckID: deckID);
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.addDeckToLearningDecks(request, options: callOptions);
    return AddDeckToLearningDecksResult(isSuccess: response.isSuccess);
  }
  Future<AddEditorToGlobalDeckResult> addEditorToGlobalDeck ({
    required String accessToken,
    required int deckID,
    required String userName
  }) async{
    final request = generated.AddEditorToGlobalDeckRequest(deckID: deckID, userName: userName);
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.addEditorToGlobalDeck(request, options: callOptions);
    return AddEditorToGlobalDeckResult(isSuccess: response.isSuccess);
  }
  Future<DemoteEditorToLearnerResult> demoteEditorToLearner ({
    required String accessToken,
    required int deckID,
    required String userName
  }) async{
    final request = generated.DemoteEditorToLearnerRequest(deckID: deckID, userName: userName);
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.demoteEditorToLearner(request, options: callOptions);
    return DemoteEditorToLearnerResult(isSuccess: response.isSuccess);
  }
}
