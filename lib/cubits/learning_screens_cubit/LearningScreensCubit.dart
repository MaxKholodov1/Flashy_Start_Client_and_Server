
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/application/use_cases/deck_progress/DeleteDeckFromLearningDecks.dart';
import 'package:flashy_start/application/use_cases/deck_progress/GetUserLearningDeckProgressList.dart';
import 'package:flashy_start/application/use_cases/deck_progress/SelectDecksForTodayReview.dart';
import 'package:flashy_start/application/use_cases/global_deck/GetGlobalDeckByID.dart';
import 'package:flashy_start/application/use_cases/progress_card/GetProgressCards.dart';
import 'package:flashy_start/application/use_cases/progress_card/SelectProgressCards.dart';
import 'package:flashy_start/domain/entities/GlobalDeckInfo.dart';
import 'package:flashy_start/domain/entities/UserCardProgress.dart';
import 'package:flashy_start/domain/failures/FailureCode.dart';

import '../../application/use_cases/progress_card/SubmitCardReview.dart';
import '../../domain/entities/RecallQualityEnum.dart';
import '../../domain/failures/failures.dart';
import '../../infrastructure/storage/SecureStorageService.dart';
import '../NavigationCubit.dart';
import 'LearningStates.dart';

class LearningScreensCubit extends Cubit<LearningScreenState> {
  final GetUserLearningDeckProgressList getULDProgressList;
  final SecureStorageService storage;
  final GetGlobalDeckInfoById getGlobalDeckInfoById;
  final GetProgressCardsByDeckID getProgressCardsByDeckID;
  final SubmitCardReview submitCardReviewUseCase;
  final SelectProgressCards selectProgressCards;
  final SelectDecksForReviewToday selectDecksForReviewToday;
  final DeleteDeckFromLearningDecks deleteDeckFromLearningDecks;
  double mainLearningScreenOffset = 0.0;

  LearningScreensCubit({
    required this.getULDProgressList,
    required this.storage,
    required this.getGlobalDeckInfoById,
    required this.getProgressCardsByDeckID,
    required this.submitCardReviewUseCase,
    required this.selectProgressCards,
    required this.selectDecksForReviewToday,
    required this.deleteDeckFromLearningDecks,
  }): super(InitState()){
    showMainLearningScreen();
  }
  void showMainLearningScreen() async {
    var userLearningProgressDecks = getULDProgressList.getCache();
    emit(MainLearningScreenState(userLearningProgressDecks: userLearningProgressDecks));
    var result = await getULDProgressList.get();
    if (result.failure == null){
      emit(MainLearningScreenState(userLearningProgressDecks: result.userDeckProgressList));
    }else {
      if (result.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }
      else if (result.failure is NetworkFailure){
        emit(MainLearningScreenState(userLearningProgressDecks:
        userLearningProgressDecks,
            failureCode: FailureCode.networkError,
            showSnackBarMessage: true,
            refreshButton: true //вызывает init снова
        ));
      }
      else {
        emit(MainLearningScreenState(userLearningProgressDecks:
        userLearningProgressDecks,
          failureCode: FailureCode.unknownError,
          showSnackBarMessage: true,
          refreshButton: true,  // вызывает init снова
        ));
      }
    }
  }
  Future<void> showLearningDeckInfo(deckID, double? offset) async{
    if (offset != null) {
      mainLearningScreenOffset = offset;
    }
    var accessToken = await storage.read("access_token");
    accessToken ??= " ";
    var  deckInfoRes =await getGlobalDeckInfoById.get(ID: deckID);
    var progressCardsRes = await getProgressCardsByDeckID.getAll(deckID: deckID);
    if (deckInfoRes.failure == null && progressCardsRes.failure == null){
      emit(LearningDeckInfoScreenState(progressCards: progressCardsRes.progressCards, globalDeckInfo: GlobalDeckInfo(globalDeck: deckInfoRes.globalDeck!, authorName: deckInfoRes.authorName!, editorNames: deckInfoRes.editorNames!)));
    }else {
      if (deckInfoRes.failure is AuthFailure || progressCardsRes.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }
      else if (deckInfoRes.failure is DeckPermissionDenied || progressCardsRes.failure is DeckPermissionDenied){
        (emit(MainLearningScreenState(userLearningProgressDecks: getULDProgressList.getCache(), showSnackBarMessage: true,
            failureCode: FailureCode.deckPermissionDenied, refreshButton: true), ));
      }else if (deckInfoRes.failure is NetworkFailure || progressCardsRes.failure is NetworkFailure) {
        (emit(MainLearningScreenState(
            userLearningProgressDecks: getULDProgressList.getCache(),
            showSnackBarMessage: true,
            failureCode: FailureCode.networkError,
            refreshButton: true),));
      }else {
        (emit(MainLearningScreenState(
            userLearningProgressDecks: getULDProgressList.getCache(),
            showSnackBarMessage: true,
            failureCode: FailureCode.unknownError,
            refreshButton: true),));
      }
    }
  }
  void showFlashcardsViewerScreen(){
    var sstate = state as LearningDeckInfoScreenState;
    if (sstate.progressCards == null ){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noCards));
      return;
    }
    if (sstate.progressCards!.isEmpty){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noCards));
      return;
    }
    emit(FlashcardsViewerScreenState(globalDeckInfo: sstate.globalDeckInfo, progressCards: sstate.progressCards,  ));
  }
  Future<void>  showLearningNewCountScreen() async{
    var sstate = state as LearningDeckInfoScreenState;
    if (sstate.progressCards == null ){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noNewCards));
      return;
    }
    if (sstate.progressCards!.isEmpty){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noNewCards));
      return;
    }
    var res = await selectProgressCards.selectNew(progressCards: sstate.progressCards!);
    if (res.failure != null){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.networkError, refreshButton: true));
    }
    if (res.progressCards == null || res.progressCards!.isEmpty){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noNewCards));
      return;
    }
    emit(SelectCountState(globalDeckInfo: sstate.globalDeckInfo, progressCards: res.progressCards!));
  }

  Future<void>  showLearningFamiliarCountScreen() async{
    var sstate = state as LearningDeckInfoScreenState;
    if (sstate.progressCards == null ){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noFamiliarCards));
      return;
    }
    if (sstate.progressCards!.isEmpty){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noFamiliarCards));
      return;
    }
    var res = await selectProgressCards.selectFamiliar(progressCards: sstate.progressCards!);
    if (res.failure != null){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.unknownError, refreshButton: true));
    }
    if (res.progressCards == null || res.progressCards!.isEmpty){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noFamiliarCards));
      return;
    }
    emit(SelectCountState(globalDeckInfo: sstate.globalDeckInfo, progressCards: res.progressCards!));
  }
  void startLearning(GlobalDeckInfo deckInfo, List<UserProgressCard> cards, int number){
    var newcards = cards;
    newcards.shuffle();
    newcards = newcards.take(number).toList();
    newcards.sort((a, b) => a.shortTermMemory.index.compareTo(b.shortTermMemory.index));
     emit(LearningCardsScreenState(globalDeckInfo: deckInfo, progressCards: newcards, ));
  }
  void showLearningAllScreen(){
    var sstate = state as LearningDeckInfoScreenState;
    if (sstate.progressCards == null ){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noCards));
      return;
    }
    if (sstate.progressCards!.isEmpty){
      emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, showSnackBarMessage: true, failureCode: FailureCode.noCards));
      return;
    }
    emit(LearningCardsScreenState(globalDeckInfo: sstate.globalDeckInfo, progressCards: sstate.progressCards!, ));
  }
  Future<void> submitLearningCardReview(RecallQuality quality) async {
    var sstate = state as LearningCardsScreenState;
    emit(sstate.copyWith(isLoading: true));

    var res = await submitCardReviewUseCase.execute(
      progressCards: sstate.progressCards,
      quality: quality,
    );
    if (res.failure == null) {
      emit(sstate.copyWith(
        progressCards: res.progressCards!,
        isLoading: false,
        refreshButton: null,
      ));
    } else {
      emit(sstate.copyWith(isLoading: true));
    }
  }
  Future<void> submitReviewingCardReview(RecallQuality quality) async {
    var sstate = state as ReviewingCardsScreenState;
    emit(sstate.copyWith(isLoading: true));

    var res = await submitCardReviewUseCase.execute(
      progressCards: sstate.progressCards,
      quality: quality,
    );
    if (res.failure == null) {
      emit(sstate.copyWith(
        progressCards: res.progressCards!,
        isLoading: false,
        refreshButton: null,
      ));
    } else {
      emit(sstate.copyWith(isLoading: true));
    }
  }

  Future<void> showDailyTasksScreen(double? offset) async{
    if (offset != null ){
      mainLearningScreenOffset = offset;
    }
    if (getULDProgressList.getCache() == null){
      emit(MainLearningScreenState(userLearningProgressDecks: getULDProgressList.getCache(), showSnackBarMessage: true, failureCode: FailureCode.noDecksForDailyTasks));
      return;
    }
    if (getULDProgressList.getCache()!.isEmpty){
      emit(MainLearningScreenState(userLearningProgressDecks: getULDProgressList.getCache(), showSnackBarMessage: true, failureCode: FailureCode.noDecksForDailyTasks));
      return;
    }
    var res = await selectDecksForReviewToday.select( progressDecks: getULDProgressList.getCache()!);
    if (res.failure == null){
      if(res.userDeckProgressList == null || res.userDeckProgressList == []){
        emit(MainLearningScreenState(userLearningProgressDecks: getULDProgressList.getCache(), showSnackBarMessage: true, failureCode: FailureCode.noDecksForDailyTasks));
      }else{
        emit(DailyTasksScreenState(todayRevisionDecks: res.userDeckProgressList!));
      }
    }
    else if (res.failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }
    else if (res.failure is NetworkFailure){
      emit(MainLearningScreenState(userLearningProgressDecks:
      getULDProgressList.getCache(),
        failureCode: FailureCode.networkError,
          showSnackBarMessage: true,
      ));
    }
    else {
      emit(MainLearningScreenState(userLearningProgressDecks:
      getULDProgressList.getCache(),
        failureCode: FailureCode.unknownError,
        showSnackBarMessage: true,
      ));
    }
  }
  Future<void> showReviewingCardsScreen(int deckID) async{
    var sstate = state as DailyTasksScreenState;
    var res = await getProgressCardsByDeckID.getForReviewToday(deckID: deckID);
    if (res.failure == null){
      if (res.progressCards == null || res.progressCards == []){
        emit(DailyTasksScreenState(todayRevisionDecks: sstate.todayRevisionDecks, showSnackBarMessage: true,failureCode: FailureCode.noCardsForReview));
      }else{
        var cards = res.progressCards!;
        cards.shuffle();
        cards.sort((a, b) => a.shortTermMemory.index.compareTo(b.shortTermMemory.index));
        emit(ReviewingCardsScreenState(progressCards: cards));
      }
    }else if (res.failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }
    else{
      emit(DailyTasksScreenState(todayRevisionDecks: sstate.todayRevisionDecks, showSnackBarMessage:true, failureCode: FailureCode.networkError ));
    }
  }
  Future<void> deleteProgressDeck() async{
    var sstate = state as LearningDeckInfoScreenState;
    var deleteRes = await deleteDeckFromLearningDecks.delete( deckID: sstate.globalDeckInfo.globalDeck.ID);
    if (deleteRes.failure == null){
      var result = await getULDProgressList.get();
      if (result.failure == null){
        emit(MainLearningScreenState(userLearningProgressDecks: result.userDeckProgressList));
      }else {
        if (result.failure is AuthFailure){
          emit(NeedAuthorizationScreenState());
        }
        else if (result.failure is NetworkFailure){
          emit(MainLearningScreenState(userLearningProgressDecks:
              [],
              failureCode: FailureCode.deletedButFailedLoadDecks,
              showSnackBarMessage: true,
              refreshButton: true //вызывает init снова
          ));
        }
        else {
          emit(MainLearningScreenState(userLearningProgressDecks:
            [],
            failureCode: FailureCode.deletedButFailedLoadDecks,
            showSnackBarMessage: true,
            refreshButton: true,  // вызывает init снова
          ));
        }
      }
    }else{
      if (deleteRes.failure is AuthorCantDeleteProgressDeckFailure){
        emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, failureCode: FailureCode.authorCantDelete, showSnackBarMessage: true));
      }else if (deleteRes.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else {
        emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo, failureCode: FailureCode.unknownError ,showSnackBarMessage: true, refreshButton: true));
      }
    }
  }
  void saveMainScreenOffset(double offset) {
    mainLearningScreenOffset = offset;
  }
  void showViewEditorsScreen(){
    var sstate = state as LearningDeckInfoScreenState;
    emit(ViewEditorsScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo));
  }
  void closeViewEditorsScreen(){
    var sstate = state as ViewEditorsScreenState;
    emit(LearningDeckInfoScreenState(progressCards: sstate.progressCards, globalDeckInfo: sstate.globalDeckInfo));
  }
  double getMainEditingOffset() => mainLearningScreenOffset;
}
