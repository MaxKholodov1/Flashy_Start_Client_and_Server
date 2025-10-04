import 'package:flashy_start/cubits/NavigationCubit.dart';
import 'package:flashy_start/domain/entities/SearchGlobalDeck.dart';

import '../../domain/entities/GlobalCard.dart';
import '../../domain/entities/GlobalDeckInfo.dart';
import '../../domain/failures/FailureCode.dart';

class InitState extends SearchingScreenState{}
class NeedAuthorizationScreenState extends SearchingScreenState{}
class MainSearchingScreenState extends SearchingScreenState {
  final List<SearchResultDeck> searchResultDecks;
  final bool? showSnackBarMessage;
  final FailureCode? failureCode;
  final bool? refreshButton;
  final String query;
  final int offset;
  final bool hasMore;
  final bool isLoadingMore;

  MainSearchingScreenState({
    required this.searchResultDecks,
    required this.query,
    required this.offset,
    required this.hasMore,
    required this.isLoadingMore,
    this.showSnackBarMessage,
    this.failureCode,
    this.refreshButton,
  });

  MainSearchingScreenState copyWith({
    List<SearchResultDeck>? searchResultDecks,
    bool? showSnackBarMessage,
    FailureCode? failureCode,
    bool? refreshButton,
    String? query,
    int? offset,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return MainSearchingScreenState(
      searchResultDecks: searchResultDecks ?? this.searchResultDecks,
      showSnackBarMessage: showSnackBarMessage ?? this.showSnackBarMessage,
      failureCode: failureCode ?? this.failureCode,
      refreshButton: refreshButton ?? this.refreshButton,
      query: query ?? this.query,
      offset: offset ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
class DeckInfoScreenState extends SearchingScreenState{
  final List<SearchResultDeck> searchResultDecks;

  final GlobalDeckInfo globalDeckInfo;
  List<GlobalCard>? globalCards;
  final String query;
  final int offset;
  final bool hasMore;
  final SearchResultDeck searchResultDeck;
  final bool? showSnackBarMessage;

  final FailureCode? failureCode;
  final bool? refreshButton;

  DeckInfoScreenState({required this.globalDeckInfo, required this.globalCards, required this.searchResultDeck,
    this.failureCode, this.showSnackBarMessage, this.refreshButton, required this.hasMore,
    required this.offset, required this.query, required this.searchResultDecks});
}
class ViewEditorsScreenState extends SearchingScreenState{
  final List<SearchResultDeck> searchResultDecks;

  final GlobalDeckInfo globalDeckInfo;
  List<GlobalCard>? globalCards;
  final String query;
  final int offset;
  final bool hasMore;
  final SearchResultDeck searchResultDeck;
  final bool? refreshButton;

  ViewEditorsScreenState({required this.globalDeckInfo, required this.globalCards, required this.searchResultDeck,
    this.refreshButton, required this.hasMore, required this.offset, required this.query, required this.searchResultDecks});
}
