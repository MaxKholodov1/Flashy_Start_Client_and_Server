
import '../../domain/entities/GlobalCard.dart';
import '../../domain/entities/GlobalDeck.dart';
import '../../domain/entities/GlobalDeckInfo.dart';
import '../../domain/failures/FailureCode.dart';
import '../NavigationCubit.dart';

class InitState extends EditingScreenState{}
class NeedAuthorizationScreenState extends EditingScreenState{}
class MainEditingScreenState extends EditingScreenState{
  final List<searchResultDeck>? editableGlobalDecks;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  MainEditingScreenState({this.showSnackBarMessage, this.failureCode,
    required this.editableGlobalDecks, this.refreshButton
  });
}
class EditingDeckScreenState extends EditingScreenState{
  final GlobalDeckInfo globalDeckInfo;
  List<GlobalCard>? globalCards;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  EditingDeckScreenState({required this.globalDeckInfo, required this.globalCards, this.failureCode, this.showSnackBarMessage, this.refreshButton});
}
class EditingDeckInfoScreenState extends EditingScreenState{

  final GlobalDeckInfo globalDeckInfo;
  List<GlobalCard>? globalCards;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  EditingDeckInfoScreenState({required this.globalDeckInfo, required this.globalCards, this.showSnackBarMessage, this.failureCode, this.refreshButton});
}
class CreatingCardScreenState extends EditingScreenState{

  final GlobalDeckInfo globalDeckInfo;
  List<GlobalCard>? globalCards;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  CreatingCardScreenState({required this.globalDeckInfo, required this.globalCards, this.showSnackBarMessage, this.failureCode,});
}

class CreateDeckScreenState extends EditingScreenState{
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final List<searchResultDeck>? editableGlobalDecks;
  CreateDeckScreenState ({this.showSnackBarMessage, this.failureCode, this.editableGlobalDecks});
}
class EditingCardScreenState extends EditingScreenState{

  final GlobalDeckInfo globalDeckInfo;
  List<GlobalCard>? globalCards;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  final GlobalCard globalCard;
  EditingCardScreenState({required this.globalDeckInfo, required this.globalCards,required this.globalCard, this.showSnackBarMessage, this.failureCode, this.refreshButton});
}
class EditingEditorsScreenState extends EditingScreenState{

  final GlobalDeckInfo globalDeckInfo;
  List<GlobalCard>? globalCards;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  EditingEditorsScreenState({required this.globalDeckInfo, required this.globalCards, this.showSnackBarMessage, this.failureCode, this.refreshButton});
}
class EditingDeckSkeletonScreenState extends EditingScreenState{
  final int deckID;
  final String title;
  final String? description;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  EditingDeckSkeletonScreenState({required this.deckID, required this.title, required this.description,this.failureCode, this.showSnackBarMessage, this.refreshButton});
}
