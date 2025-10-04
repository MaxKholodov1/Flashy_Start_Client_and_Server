import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/application/responses/global_card/GetGlobalCardsResult.dart';
import 'package:flashy_start/application/use_cases/global_card/CreateAndDeleteGlobalCard.dart';
import 'package:flashy_start/application/use_cases/global_card/GetGlobalCardsByDeckID.dart';
import 'package:flashy_start/application/use_cases/global_card/UpdateGlobalCard.dart';
import 'package:flashy_start/application/use_cases/global_deck/EditorUseCases.dart';
import 'package:flashy_start/application/use_cases/global_deck/GetEditableGlobalDecks.dart';
import 'package:flashy_start/application/use_cases/global_deck/GetGlobalDeckByID.dart';
import 'package:flashy_start/application/use_cases/global_deck/UpdateGlobalDeck.dart';
import 'package:flashy_start/domain/entities/GlobalCard.dart';
import 'package:flashy_start/domain/entities/GlobalDeck.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import '../../application/responses/global_card/UpdateGlobalCardResult.dart';
import '../../application/use_cases/global_deck/CreateAndDeleteGlobalDeck.dart';
import '../../domain/entities/GlobalDeckInfo.dart';
import '../../domain/failures/FailureCode.dart';
import '../NavigationCubit.dart';
import 'EditingStates.dart';


class EditScreensCubit extends Cubit<EditingScreenState> {
  final CreateAndDeleteGlobalDeck createGlobalDeck;
  final GetEditableGlobalDecks getEditableGlobalDecks;
  final GetGlobalDeckInfoById getGlobalDeckInfoById;
  final UpdateGlobalDeck updateGlobalDeck;
  final CreateAndDeleteGlobalCard createAndDeleteGlobalCard;
  final GetGlobalCardsByDeckID getGlobalCardsByDeckID;
  final UpdateGlobalCard updateGlobalCard;
  final EditorUseCases editorUseCases;
  double mainEditingScreenOffset = 0.0;
  double deckEditingScreenOffset = 0.0;
  EditScreensCubit({
    required this.createGlobalDeck,
    required this.getEditableGlobalDecks,
    required this.getGlobalDeckInfoById,
    required this.updateGlobalDeck,
    required this.createAndDeleteGlobalCard,
    required this.getGlobalCardsByDeckID,
    required this.updateGlobalCard,
    required this.editorUseCases,
  }) : super(InitState()){
    init();
  }
  void init() async {
    var editableGlobalDecks = getEditableGlobalDecks.getCache();
    emit(MainEditingScreenState(editableGlobalDecks: editableGlobalDecks));
    var result = await getEditableGlobalDecks.get();
    if (result.failure == null){
      emit(MainEditingScreenState(editableGlobalDecks: result.globalDecks));
    }else {
      if (result.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }
      else if (result.failure is NetworkFailure){
        emit(MainEditingScreenState(editableGlobalDecks:
        editableGlobalDecks,
          failureCode: FailureCode.networkError,
          showSnackBarMessage: true,
          refreshButton: true //вызывает init снова
        ));
      }
      else {
        emit(MainEditingScreenState(editableGlobalDecks:
        editableGlobalDecks,
          failureCode: FailureCode.unknownError,
          showSnackBarMessage: true,
          refreshButton: true,  // вызывает init снова
        ));
      }
    }
  }

  Future<void> saveDeck({required String title, String? description, required bool isPublic}) async {
    final result = await createGlobalDeck.create(
        title: title,
        description: description,
        isPublic: isPublic);
    if (result.failure == null) {
      var getGlobalDeckRes = await getGlobalDeckInfoById.get(ID: result.globalDeckID!);
      if (getGlobalDeckRes.failure == null){
        emit(EditingDeckScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck:  getGlobalDeckRes.globalDeck!, authorName: getGlobalDeckRes.authorName!, editorNames: getGlobalDeckRes.editorNames), globalCards: []));
      }else if (getGlobalDeckRes.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else if (getGlobalDeckRes.failure is NetworkFailure){
        emit(CreateDeckScreenState(showSnackBarMessage: true, failureCode: FailureCode.deckCreatedButFailedToLoad, editableGlobalDecks: getEditableGlobalDecks.getCache()));
      }else{
        emit(CreateDeckScreenState(showSnackBarMessage: true, failureCode: FailureCode.deckCreatedButFailedToLoad, editableGlobalDecks: getEditableGlobalDecks.getCache()));
      }
    }else {
      if (result.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else if (result.failure is CreateDeckInvalidTitleFailure){
        emit(CreateDeckScreenState(showSnackBarMessage: true, failureCode: FailureCode.titleIsEmpty, editableGlobalDecks: getEditableGlobalDecks.getCache()));
      }else if (result.failure is NetworkFailure){
        emit(CreateDeckScreenState(showSnackBarMessage: true,failureCode: FailureCode.networkError, editableGlobalDecks: getEditableGlobalDecks.getCache()));
      }else{
        emit(CreateDeckScreenState(showSnackBarMessage: true, failureCode: FailureCode.unknownError, editableGlobalDecks: getEditableGlobalDecks.getCache()));
      }
    }
  }
  void showCreateDeckScreen(){
    mainEditingScreenOffset = 0;
    emit(CreateDeckScreenState(editableGlobalDecks: getEditableGlobalDecks.getCache()));
  }
  void cancelCreatingDeck(){
    emit(MainEditingScreenState(editableGlobalDecks: getEditableGlobalDecks.getCache()));
  }
  Future<void> showGlobalDeckInfo(globalDeckID,title, description, double? offset) async {
    if (offset != null) {
      mainEditingScreenOffset = offset;
    }

    emit(EditingDeckSkeletonScreenState(deckID: globalDeckID, title: title, description: description));
    var getGlobalDeckInfoRes = await getGlobalDeckInfoById.get(ID: globalDeckID!);
    if (getGlobalDeckInfoRes.failure == null){
      GetGlobalCardsResult getCardsResult = await getGlobalCardsByDeckID.get(deckID: globalDeckID);
      if (getCardsResult.failure == null){
        emit(EditingDeckScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck:  getGlobalDeckInfoRes.globalDeck!, authorName: getGlobalDeckInfoRes.authorName!, editorNames: getGlobalDeckInfoRes.editorNames), globalCards: getCardsResult.globalCards));
      }else if( getCardsResult.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else if(getCardsResult.failure is NetworkFailure){
        emit(EditingDeckScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck:  getGlobalDeckInfoRes.globalDeck!, authorName: getGlobalDeckInfoRes.authorName!, editorNames: getGlobalDeckInfoRes.editorNames), globalCards: [], showSnackBarMessage: true, failureCode: FailureCode.cardsLoadFailedDueToNetwork, refreshButton: true));
      }else{
        emit(EditingDeckScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck:  getGlobalDeckInfoRes.globalDeck!, authorName: getGlobalDeckInfoRes.authorName!, editorNames: getGlobalDeckInfoRes.editorNames), globalCards: [], showSnackBarMessage: true, failureCode: FailureCode.cardsLoadFailedDueToUnknownFailure, refreshButton: true));
      }
    }else if (getGlobalDeckInfoRes.failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }else if (getGlobalDeckInfoRes.failure is NetworkFailure){
      emit(MainEditingScreenState(showSnackBarMessage: true, failureCode: FailureCode.networkError, editableGlobalDecks: getEditableGlobalDecks.getCache(), refreshButton: true));
    }else{
      emit(MainEditingScreenState(showSnackBarMessage: true, failureCode: FailureCode.unknownError, editableGlobalDecks: getEditableGlobalDecks.getCache(), refreshButton: true));
    }
  }
  void showEditingDeckInfoScreen({ required globalDeckInfo, globalCards}){
    emit(EditingDeckInfoScreenState(globalDeckInfo:  globalDeckInfo, globalCards: globalCards));
  }
  void cancelEditingDeckInfo(){
    var sstate = state as EditingDeckInfoScreenState;
    emit(EditingDeckScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards));
  }
  void cancelCreatingCard(){
    var sstate = state as CreatingCardScreenState;
    emit(EditingDeckScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards));
  }
  Future<void> showMainEditingScreen() async{
    var editableGlobalDecks = getEditableGlobalDecks.getCache();
    emit(MainEditingScreenState(editableGlobalDecks: editableGlobalDecks));
    var result = await getEditableGlobalDecks.get();
    if (result.failure == null){
      emit(MainEditingScreenState(editableGlobalDecks: result.globalDecks));
    }else {
      if (result.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else if (result.failure is NetworkFailure){
        emit(MainEditingScreenState(editableGlobalDecks:
          editableGlobalDecks,
          failureCode: FailureCode.decksLoadFailedDueToNetwork,
          showSnackBarMessage: true,
          refreshButton: true
        ));
      }
      else {
        emit(MainEditingScreenState(editableGlobalDecks:
        editableGlobalDecks,
          failureCode: FailureCode.decksLoadFailedDueToUnknownFailure,
          showSnackBarMessage: true,
          refreshButton: true,
        ));
      }
    }
  }
  void showCreatingCardScreen(GlobalDeckInfo globalDeckInfo, List<GlobalCard>? globalCards){
    deckEditingScreenOffset = 0;
    emit(CreatingCardScreenState(globalDeckInfo:globalDeckInfo, globalCards: globalCards));
  }
  Future<void> createGlobalCard({required String question, required String answer, required int deckID})  async{
    final result = await createAndDeleteGlobalCard.create(question: question, answer: answer, deckID: deckID);
    var sstate = state as CreatingCardScreenState;
    var gdi = sstate.globalDeckInfo;
    var gc = sstate.globalCards;
    var failure = result.failure;
    if (failure == null){
      emit(EditingDeckSkeletonScreenState(deckID: deckID, title: sstate.globalDeckInfo.globalDeck.title, description: sstate.globalDeckInfo.globalDeck.description));
      GetGlobalCardsResult getCardsResult = await getGlobalCardsByDeckID.get(deckID: gdi.globalDeck.ID);
      if (getCardsResult.failure == null){
        emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: getCardsResult.globalCards));
      }else if( getCardsResult.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else if(getCardsResult.failure is NetworkFailure){
        emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: sstate.globalCards, showSnackBarMessage: true, failureCode: FailureCode.cardCreatedButFailedToLoadCards, refreshButton: true));
      }else{
        emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: sstate.globalCards, showSnackBarMessage: true, failureCode: FailureCode.cardCreatedButFailedToLoadCards, refreshButton: true));
      }
    }else if (failure is NetworkFailure){
      emit(CreatingCardScreenState(globalDeckInfo: gdi, globalCards: gc, showSnackBarMessage: true,failureCode: FailureCode.networkError));
    }else if (failure is InvalidCardArgument){
      emit(CreatingCardScreenState(globalDeckInfo: gdi, globalCards: gc, showSnackBarMessage: true, failureCode: FailureCode.invalidCardArgument));
    }else if (failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }else if (failure is DeckPermissionDenied){
      emit(EditingDeckInfoScreenState(showSnackBarMessage: true,failureCode: FailureCode.deckPermissionDenied, globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards));
    }else {
      emit(CreatingCardScreenState(globalDeckInfo: gdi, globalCards: gc, showSnackBarMessage: true, failureCode: FailureCode.unknownError));
    }
  }
  void showEditingCardScreen(double offset, GlobalCard globalCard){
    deckEditingScreenOffset = offset;
    var sstate = state as EditingDeckScreenState;
    emit(EditingCardScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, globalCard: globalCard));
  }
  void cancelEditingCard(){
    var sstate = state as EditingCardScreenState;
    emit(EditingDeckScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards));
  }
  Future<void> deleteCard (int cardID) async{
    final result = await createAndDeleteGlobalCard.delete(cardID: cardID);
    var sstate = state as EditingDeckScreenState;
    var gdi = sstate.globalDeckInfo;
    var failure = result.failure;
    if (failure == null){
      emit(EditingDeckSkeletonScreenState(deckID: sstate.globalDeckInfo.globalDeck.ID, title: sstate.globalDeckInfo.globalDeck.title, description: sstate.globalDeckInfo.globalDeck.description));
      GetGlobalCardsResult getCardsResult = await getGlobalCardsByDeckID.get(deckID: gdi.globalDeck.ID);
      if (getCardsResult.failure == null){
        emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: getCardsResult.globalCards));
      }else if( getCardsResult.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else if(getCardsResult.failure is NetworkFailure){
        emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: sstate.globalCards, showSnackBarMessage: true, failureCode: FailureCode.cardDeletedButFailedToLoadCards , refreshButton: true));
      }else{
        emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: sstate.globalCards, showSnackBarMessage: true, failureCode: FailureCode.cardDeletedButFailedToLoadCards, refreshButton: true));
      }
    }else if (failure is NetworkFailure){
      emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: sstate.globalCards, showSnackBarMessage: true, failureCode: FailureCode.networkError, refreshButton: true));
    }else if (failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }else if (failure is DeckPermissionDenied){
      emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: sstate.globalCards, showSnackBarMessage: true, failureCode: FailureCode.deckPermissionDenied, refreshButton: true));
    }else {
      emit(EditingDeckScreenState(globalDeckInfo: gdi, globalCards: sstate.globalCards, showSnackBarMessage: true, failureCode: FailureCode.unknownError, refreshButton: true));
    }
  }

  Future<void> deleteGlobalDeck( int deckID) async{
    var res =await  createGlobalDeck.delete(deckID: deckID);
    if (res.failure == null){
      if (res.isSuccess == true){
        var result = await getEditableGlobalDecks.get();
        if (result.failure == null){
          emit(MainEditingScreenState(editableGlobalDecks: result.globalDecks));
        }else {
          if (result.failure is AuthFailure) {
            emit(NeedAuthorizationScreenState());
          } else if (result.failure is NetworkFailure) {
            emit(MainEditingScreenState(editableGlobalDecks:
            getEditableGlobalDecks.getCache(),
                failureCode: FailureCode.deckDeletedButFailedToLoadDecks,
                showSnackBarMessage: true,
                refreshButton: true
            ));
          }
        }
      }else if (res.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }
      else {
        emit(MainEditingScreenState(editableGlobalDecks: getEditableGlobalDecks.getCache(),
            showSnackBarMessage: true, failureCode: FailureCode.unknownError));
      }
    }else if (res.failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }else if (res.failure is DeckPermissionDenied){
      emit(MainEditingScreenState(editableGlobalDecks: getEditableGlobalDecks.getCache(),));

      emit(MainEditingScreenState(editableGlobalDecks: getEditableGlobalDecks.getCache(),
          showSnackBarMessage: true, failureCode:  FailureCode.deckPermissionDenied));
    }
    else {
      emit(MainEditingScreenState(editableGlobalDecks: getEditableGlobalDecks.getCache(),));
      emit(MainEditingScreenState(editableGlobalDecks: getEditableGlobalDecks.getCache(),
          showSnackBarMessage: true, failureCode:  FailureCode.unknownError));
    }
  }
  void showEditingEditorsScreen (){
    var sstate = state as EditingDeckScreenState;
    emit(EditingEditorsScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards));
  }
 Future<void> addEditorToGlobalDeck(String userName) async {
    var sstate = state as EditingEditorsScreenState;
    var deckID = sstate.globalDeckInfo.globalDeck.ID;
    var res = await editorUseCases.add(deckID: deckID, userName: userName);
    if (res.failure == null){
      var getGlobalDeckRes = await getGlobalDeckInfoById.get(ID: sstate.globalDeckInfo.globalDeck.ID);
      if (getGlobalDeckRes.failure == null){
        emit(EditingEditorsScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck:  getGlobalDeckRes.globalDeck!, authorName: getGlobalDeckRes.authorName!, editorNames: getGlobalDeckRes.editorNames), globalCards: []));
      }else if (getGlobalDeckRes.failure is AuthFailure){
        emit(NeedAuthorizationScreenState());
      }else if (getGlobalDeckRes.failure is NetworkFailure){
        emit(EditingEditorsScreenState(showSnackBarMessage: true, failureCode: FailureCode.networkError, globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards,));
      }else{
        emit(EditingEditorsScreenState(showSnackBarMessage: true, failureCode: FailureCode.unknownError, globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards,));
      }
    }else if (res.failure is SuchPermissionAlreadyExistsFailure){
      emit(EditingEditorsScreenState(showSnackBarMessage: true, failureCode: FailureCode.suchPermissionAlreadyExists, globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards,));
    }else if (res.failure is DeckPermissionDenied){
      emit(EditingEditorsScreenState(showSnackBarMessage: true, failureCode: FailureCode.deckPermissionDenied, globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards,));
    }
    else if (res.failure is UserNotFoundFailure){
      emit(EditingEditorsScreenState(showSnackBarMessage: true, failureCode: FailureCode.userNotFound, globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards,));
    }else{
      emit(EditingEditorsScreenState(showSnackBarMessage: true, failureCode: FailureCode.networkError, globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards,));
    }

 }
  //TODO
  Future<void> updateCard({required String question, required String answer}) async{
    var sstate = state as EditingCardScreenState;
    if (answer == "" || question == ""){
      emit(EditingCardScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, globalCard: sstate.globalCard, showSnackBarMessage: true, failureCode: FailureCode.invalidCardArgument));
      return;
    }
    GlobalCard card = sstate.globalCard;
    int globalDeckID = sstate.globalDeckInfo.globalDeck.ID;
    UpdateGlobalCardResult updateGlobalCardResult = await updateGlobalCard.update(question: question, answer: answer, cardID: card.ID, currentVersion: card.version);
    Failure? failure = updateGlobalCardResult.failure;
    if (failure == null){
      if (updateGlobalCardResult.isSuccess == true){
        emit(EditingDeckSkeletonScreenState(deckID: sstate.globalDeckInfo.globalDeck.ID, title: sstate.globalDeckInfo.globalDeck.title, description: sstate.globalDeckInfo.globalDeck.description));
        GetGlobalCardsResult getCardsResult = await getGlobalCardsByDeckID.get(deckID: globalDeckID);
        if (getCardsResult.failure == null){
          emit(EditingDeckScreenState(globalDeckInfo:sstate.globalDeckInfo, globalCards: getCardsResult.globalCards));
        }else if( getCardsResult.failure is AuthFailure){
          emit(NeedAuthorizationScreenState());
        }else if(getCardsResult.failure is NetworkFailure){
          emit(EditingDeckScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: [], showSnackBarMessage: true, failureCode: FailureCode.cardsLoadFailedDueToNetwork, refreshButton: true));
        }else{
          emit(EditingDeckScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: [], showSnackBarMessage: true, failureCode: FailureCode.cardsLoadFailedDueToUnknownFailure, refreshButton: true));
        }
      }else {
        emit(EditingCardScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, globalCard: updateGlobalCardResult.conflictCard!,
          showSnackBarMessage: true, failureCode: FailureCode.conflictCardError,
        ));
      }
    }else if(failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }else if (failure is NetworkFailure){
      emit(EditingCardScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, globalCard: sstate.globalCard, showSnackBarMessage: true, failureCode: FailureCode.networkError, refreshButton: true));
    }else if (failure is UnknownFailure){
      emit(EditingCardScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, globalCard: sstate.globalCard, showSnackBarMessage: true, failureCode: FailureCode.unknownError, refreshButton: true));
    }else if (failure is DeckPermissionDenied){
      emit(EditingDeckScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards,));
    }else if (failure is GlobalCardNotFoundFailure){
      emit(EditingDeckScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, showSnackBarMessage: true, refreshButton: true, failureCode: FailureCode.cardWasDeletedRefreshData,));
    }else{
      emit(EditingCardScreenState(globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards, globalCard: sstate.globalCard, showSnackBarMessage: true, failureCode: FailureCode.unknownError, refreshButton: true));
    }
  }
  Future<void> updateGlobalDeckInfo(String title, String? description) async{
    searchResultDeck globalDeck = (state as EditingDeckInfoScreenState).globalDeckInfo.globalDeck;
    var sstate = (state as EditingDeckInfoScreenState);
    searchResultDeck newGlobalDeck = globalDeck.copyInfoWith(description: description, title: title);
    var updateGlobalDeckRes = await updateGlobalDeck.update(globalDeck: newGlobalDeck);
    if (updateGlobalDeckRes.failure == null){
      if (updateGlobalDeckRes.isSuccess == true) {
        //TODO тут еще можно сделать обновление получение карточек
        var  updatedDeckInfoRes = await getGlobalDeckInfoById.get(ID: globalDeck.ID);
        if (updatedDeckInfoRes.failure == null){
          emit(EditingDeckScreenState(globalDeckInfo: GlobalDeckInfo(globalDeck:  updatedDeckInfoRes.globalDeck!, authorName: updatedDeckInfoRes.authorName!, editorNames: updatedDeckInfoRes.editorNames), globalCards: sstate.globalCards));
        }else if (updatedDeckInfoRes.failure is AuthFailure){
          emit(NeedAuthorizationScreenState());
        }else if (updatedDeckInfoRes.failure is NetworkFailure){
          emit(MainEditingScreenState(showSnackBarMessage: true, failureCode: FailureCode.deckUpdatedButFailedGetInfo, editableGlobalDecks: getEditableGlobalDecks.getCache(), refreshButton: true));
        }else{
          emit(MainEditingScreenState(showSnackBarMessage: true, failureCode: FailureCode.deckUpdatedButFailedGetInfo, editableGlobalDecks: getEditableGlobalDecks.getCache(), refreshButton: true));
        }
      }else{
        emit(EditingDeckInfoScreenState(showSnackBarMessage: true,
            failureCode: FailureCode.conflictDeckError,
            globalDeckInfo: GlobalDeckInfo(globalDeck: updateGlobalDeckRes.conflictDeck!, authorName: sstate.globalDeckInfo.authorName, editorNames: sstate.globalDeckInfo.editorNames),
            globalCards: [],refreshButton: true
        ));
      }
    }else if (updateGlobalDeckRes.failure is CreateDeckInvalidTitleFailure){
      emit(EditingDeckInfoScreenState(showSnackBarMessage: true, failureCode: FailureCode.titleIsEmpty, globalDeckInfo: sstate.globalDeckInfo, globalCards: sstate.globalCards));
    }
    else if (updateGlobalDeckRes.failure is AuthFailure){
      emit(NeedAuthorizationScreenState());
    }else if (updateGlobalDeckRes.failure is NetworkFailure){
      emit(EditingDeckInfoScreenState(showSnackBarMessage: true, failureCode: FailureCode.networkError, globalDeckInfo: sstate.globalDeckInfo, globalCards: []));
    }else if (updateGlobalDeckRes.failure is DeckPermissionDenied){
      emit(EditingDeckInfoScreenState(showSnackBarMessage: true, failureCode: FailureCode.deckPermissionDenied, globalDeckInfo: sstate.globalDeckInfo, globalCards: []));
    }
    else{
      emit(EditingDeckInfoScreenState(showSnackBarMessage: true, failureCode: FailureCode.unknownError, globalDeckInfo: sstate.globalDeckInfo, globalCards: []));
    }
  }

  double getMainEditingOffset() => mainEditingScreenOffset;
  double getDeckEditingScreenOffset() => deckEditingScreenOffset;
}