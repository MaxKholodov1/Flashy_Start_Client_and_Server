import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/application/use_cases/global_deck/AddDeckToLearningDecks.dart';
import 'package:flashy_start/application/use_cases/global_deck/SearchGlobalDecks.dart';
import 'package:flashy_start/domain/failures/FailureCode.dart';

import '../../application/responses/global_card/GetGlobalCardsResult.dart';
import '../../application/use_cases/global_card/GetGlobalCardsByDeckID.dart';
import '../../application/use_cases/global_deck/GetGlobalDeckByID.dart';
import '../../domain/entities/GlobalDeckInfo.dart';
import '../../domain/entities/SearchGlobalDeck.dart';
import '../../domain/failures/failures.dart';
import '../NavigationCubit.dart';
import 'SearchingStates.dart';

class SearchingScreensCubit extends Cubit<SearchingScreenState> {
  final GetGlobalDeckInfoById getGlobalDeckInfoById;
  final GetGlobalCardsByDeckID getGlobalCardsByDeckID;
  final SearchGlobalDecks searchGlobalDecks;
  final AddDeckToLearningDecks addDeckToLearningDecks;
  double mainEditingScreenOffset = 0.0;

  SearchingScreensCubit({
    required this.getGlobalDeckInfoById,
    required this.getGlobalCardsByDeckID,
    required this.searchGlobalDecks,
    required this.addDeckToLearningDecks,
  }) : super(InitState()) {
    init();
  }

  void init() async {

    var result = await searchGlobalDecks.search(
      query: "",
      offset: 0,
      limit: 30,
    );

    if (result.failure == null) {
      emit(MainSearchingScreenState(
        searchResultDecks: result.searchResultDecks ?? [],
        query: '',
        offset: (result.searchResultDecks?.length ?? 0),
        hasMore: result.hasMore ?? false,
        isLoadingMore: false,
      ));
    } else {
      if (result.failure is AuthFailure) {
        emit(NeedAuthorizationScreenState());
      } else if (result.failure is NetworkFailure) {
        emit(MainSearchingScreenState(
          searchResultDecks: [],
          failureCode: FailureCode.networkError,
          showSnackBarMessage: true,
          refreshButton: true,
          query: '',
          offset: 0,
          hasMore: false,
          isLoadingMore: false,
        ));
      } else {
        emit(MainSearchingScreenState(
          searchResultDecks: [],
          failureCode: FailureCode.unknownError,
          showSnackBarMessage: true,
          refreshButton: true,
          query: '',
          offset: 0,
          hasMore: false,
          isLoadingMore: false,
        ));
      }
    }
  }

  void search(String query) async {
    emit((state as MainSearchingScreenState).copyWith(
      query: query,
      offset: 0,
      searchResultDecks: [],
      isLoadingMore: true,
    ));

    final result = await searchGlobalDecks.search(
      query: query,
      offset: 0,
      limit: 30,
    );

    if (result.failure == null) {
      emit((state as MainSearchingScreenState).copyWith(
        searchResultDecks: result.searchResultDecks ?? [],
        hasMore: result.hasMore ?? false,
        offset: 30,
        isLoadingMore: false,
      ));
    } else {
      if (result.failure is AuthFailure) {
        emit(NeedAuthorizationScreenState());
      } else if (result.failure is NetworkFailure) {
        emit((state as MainSearchingScreenState).copyWith(isLoadingMore: false,
            showSnackBarMessage: true,
            failureCode: FailureCode.networkError,
            refreshButton: true
        ));
      } else {
        emit((state as MainSearchingScreenState).copyWith(isLoadingMore: false,
            showSnackBarMessage: true,
            failureCode: FailureCode.unknownError,
            refreshButton: true
        ));
      }
    }
  }

  void loadMore() async {
    final currentState = state as MainSearchingScreenState;
    if (currentState.isLoadingMore || !currentState.hasMore) return;

    emit(currentState.copyWith(isLoadingMore: true));

    final result = await searchGlobalDecks.search(
      query: currentState.query,
      offset: currentState.offset,
      limit: 20,
    );

    if (result.failure == null) {
      emit(currentState.copyWith(
        searchResultDecks: [
          ...currentState.searchResultDecks,
          ...?result.searchResultDecks
        ],
        hasMore: result.hasMore ?? false,
        offset: currentState.offset + 30,
        isLoadingMore: false,
      ));
    } else {
      if (result.failure is AuthFailure) {
        emit(NeedAuthorizationScreenState());
      } else if (result.failure is NetworkFailure) {
        emit(currentState.copyWith(isLoadingMore: false,
            showSnackBarMessage: true,
            failureCode: FailureCode.networkError,
            refreshButton: true
        ));
      } else {
        emit(currentState.copyWith(isLoadingMore: false,
            showSnackBarMessage: true,
            failureCode: FailureCode.unknownError,
            refreshButton: true
        ));
      }
    }
  }

  Future<void> addToLearningDecks(int deckID) async {
    var sstate = state as MainSearchingScreenState;
    var res = await addDeckToLearningDecks.add(deckID: deckID);
    if (res.isSuccess == true) {
      final updatedList = sstate.searchResultDecks.map((deck) {
        if (deck.globalDeck.ID == deckID) {
          return SearchResultDeck(
            globalDeck: deck.globalDeck,
            isAlreadyAdded: true,
          );
        }
        return deck;
      }).toList();
      emit(sstate.copyWith(searchResultDecks: updatedList));
    }else {
      if (res.failure is AuthFailure) {
        emit(NeedAuthorizationScreenState());
      } else if (res.failure is NetworkFailure) {
        emit(sstate.copyWith(isLoadingMore: false,
            showSnackBarMessage: true,
            failureCode: FailureCode.networkError,
            refreshButton: true
        ));
      } else {
        emit(sstate.copyWith(isLoadingMore: false,
            showSnackBarMessage: true,
            failureCode: FailureCode.unknownError,
            refreshButton: true
        ));
      }
    }
  }
  Future<void> showGlobalDeckInfo(SearchResultDeck searchResultDeck, double screenOffset) async {
    mainEditingScreenOffset = screenOffset;
    var sstate = state as MainSearchingScreenState;
    var getGlobalDeckInfoRes = await getGlobalDeckInfoById.get(ID: searchResultDeck.globalDeck.ID);
    if (getGlobalDeckInfoRes.failure == null){
      GetGlobalCardsResult getCardsResult = await getGlobalCardsByDeckID.get(deckID: searchResultDeck.globalDeck.ID);
      if (getCardsResult.failure == null){
        emit(DeckInfoScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck: getGlobalDeckInfoRes.globalDeck!, authorName: getGlobalDeckInfoRes.authorName!, editorNames: getGlobalDeckInfoRes.editorNames),
            globalCards: getCardsResult.globalCards, searchResultDeck: searchResultDeck, hasMore: sstate.hasMore, offset: sstate.offset, query: sstate.query, searchResultDecks: sstate.searchResultDecks,
        ));
      }else if( getCardsResult.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else if(getCardsResult.failure is NetworkFailure){
        emit(DeckInfoScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck:  getGlobalDeckInfoRes.globalDeck!, authorName: getGlobalDeckInfoRes.authorName!, editorNames: getGlobalDeckInfoRes.editorNames),
            globalCards: [], showSnackBarMessage: true, failureCode: FailureCode.cardsLoadFailedDueToNetwork,
            refreshButton: true,searchResultDeck: searchResultDeck, hasMore: sstate.hasMore, offset: sstate.offset, query: sstate.query, searchResultDecks: sstate.searchResultDecks,
        ));
      }else{
        emit(DeckInfoScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck:  getGlobalDeckInfoRes.globalDeck!, authorName: getGlobalDeckInfoRes.authorName!, editorNames: getGlobalDeckInfoRes.editorNames),
            globalCards: [], showSnackBarMessage: true, failureCode: FailureCode.cardsLoadFailedDueToNetwork, refreshButton: true,
          searchResultDeck: searchResultDeck, hasMore: sstate.hasMore, offset: sstate.offset, query: sstate.query, searchResultDecks: sstate.searchResultDecks,
        ));
      }
    }else if (getGlobalDeckInfoRes.failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }else if (getGlobalDeckInfoRes.failure is NetworkFailure){
      emit(sstate.copyWith(showSnackBarMessage: true, failureCode: FailureCode.networkError, refreshButton: true));
    }else{
      emit(sstate.copyWith(showSnackBarMessage: true, failureCode: FailureCode.unknownError));
    }
  }
  void showMainSearchingScreen(){
    var sstate = state as DeckInfoScreenState;
    emit(MainSearchingScreenState(searchResultDecks: sstate.searchResultDecks, query: sstate.query, offset: sstate.offset, hasMore: sstate.hasMore, isLoadingMore: false));
  }
  void showViewEditorsScreen(){
    var sstate = state as DeckInfoScreenState;
    emit(ViewEditorsScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, searchResultDeck: sstate.searchResultDeck, hasMore: sstate.hasMore, offset: sstate.offset, query: sstate.query, searchResultDecks: sstate.searchResultDecks, refreshButton: sstate.refreshButton));
  }
  void closeViewEditorsScreen(){
    var sstate = state as ViewEditorsScreenState;
    emit(DeckInfoScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, searchResultDeck: sstate.searchResultDeck, hasMore: sstate.hasMore, offset: sstate.offset, query: sstate.query, searchResultDecks: sstate.searchResultDecks, refreshButton: sstate.refreshButton));
  }
  double getMainEditingScreenOffset() {  return mainEditingScreenOffset;}
}