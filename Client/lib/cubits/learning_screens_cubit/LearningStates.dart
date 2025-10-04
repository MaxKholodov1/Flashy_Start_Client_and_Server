import 'package:flashy_start/cubits/NavigationCubit.dart';
import 'package:flashy_start/domain/entities/UserCardProgress.dart';
import 'package:flashy_start/domain/entities/UserDeckProgress.dart';

import '../../domain/entities/GlobalDeckInfo.dart';
import '../../domain/failures/FailureCode.dart';

class InitState extends LearningScreenState{}
class NeedAuthorizationScreenState extends LearningScreenState{}
class MainLearningScreenState extends LearningScreenState{
  final List<UserDeckProgress>? userLearningProgressDecks;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  MainLearningScreenState({this.showSnackBarMessage, this.failureCode,
    required this.userLearningProgressDecks, this.refreshButton
  });
}
class LearningDeckInfoScreenState extends LearningScreenState{
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  final GlobalDeckInfo globalDeckInfo;
  List<UserProgressCard>? progressCards;
  LearningDeckInfoScreenState({this.showSnackBarMessage, this.failureCode,required this.progressCards,
     this.refreshButton, required this.globalDeckInfo,
  });
}
class FlashcardsViewerScreenState extends LearningScreenState{
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  final GlobalDeckInfo globalDeckInfo;
  List<UserProgressCard>? progressCards;
  FlashcardsViewerScreenState({required this.globalDeckInfo, this.refreshButton, this.showSnackBarMessage,
  required this.progressCards, this.failureCode});
}
class SelectCountState extends LearningScreenState{
  final GlobalDeckInfo globalDeckInfo;
  final List<UserProgressCard> progressCards;

  SelectCountState({required this.globalDeckInfo, required this.progressCards});
}
class LearningCardsScreenState extends LearningScreenState {
  final bool? showSnackBarMessage;
  final String? snackBarMessage;
  final bool? refreshButton;
  final GlobalDeckInfo globalDeckInfo;
  final List<UserProgressCard> progressCards;
  final bool isLoading;

  LearningCardsScreenState({
    required this.globalDeckInfo,
    this.refreshButton,
    this.showSnackBarMessage,
    required this.progressCards,
    this.snackBarMessage,
    this.isLoading = false,
  });

  LearningCardsScreenState copyWith({
    bool? showSnackBarMessage,
    String? snackBarMessage,
    bool? refreshButton,
    GlobalDeckInfo? globalDeckInfo,
    List<UserProgressCard>? progressCards,
    bool? isLoading,
  }) {
    return LearningCardsScreenState(
      showSnackBarMessage: showSnackBarMessage ?? this.showSnackBarMessage,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      refreshButton: refreshButton ?? this.refreshButton,
      globalDeckInfo: globalDeckInfo ?? this.globalDeckInfo,
      progressCards: progressCards ?? this.progressCards,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
class DailyTasksScreenState extends LearningScreenState{
  final List<UserDeckProgress> todayRevisionDecks;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;
  DailyTasksScreenState({this.showSnackBarMessage, this.failureCode, this.refreshButton, required  this.todayRevisionDecks});
}
class ReviewingCardsScreenState extends LearningScreenState {
  final bool? showSnackBarMessage;
  final FailureCode? failureCode;
  final bool? refreshButton;
  final List<UserProgressCard> progressCards;
  final bool isLoading;

  ReviewingCardsScreenState({
    this.refreshButton,
    this.showSnackBarMessage,
    required this.progressCards,
    this.failureCode,
    this.isLoading = false,
  });

  ReviewingCardsScreenState copyWith({
    bool? showSnackBarMessage,
    FailureCode? failureCode,
    bool? refreshButton,
    GlobalDeckInfo? globalDeckInfo,
    List<UserProgressCard>? progressCards,
    bool? isLoading,
  }) {
    return ReviewingCardsScreenState(
      showSnackBarMessage: showSnackBarMessage ?? this.showSnackBarMessage,
      failureCode: failureCode ?? this.failureCode,
      refreshButton: refreshButton ?? this.refreshButton,
      progressCards: progressCards ?? this.progressCards,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
class ViewEditorsScreenState extends LearningScreenState{

  final GlobalDeckInfo globalDeckInfo;
  List<UserProgressCard>? progressCards;
  ViewEditorsScreenState({required this.progressCards, required this.globalDeckInfo,
  });
}
