import 'package:flashy_start/domain/entities/SearchGlobalDeck.dart';

import '../../../domain/failures/failures.dart';

class SearchGlobalDecksResult {
  final List<SearchResultDeck>? searchResultDecks;
  final bool? hasMore;
  final Failure? failure;
  SearchGlobalDecksResult({
    this.searchResultDecks,
    this.hasMore,
    this.failure
  });
}