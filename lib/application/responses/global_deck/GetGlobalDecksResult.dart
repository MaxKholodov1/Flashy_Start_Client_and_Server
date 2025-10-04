import 'package:flashy_start/domain/entities/GlobalDeck.dart';

import '../../../domain/failures/failures.dart';

class GetGlobalDecksResult {
  final List<searchResultDeck>? globalDecks;
  final Failure? failure;
  GetGlobalDecksResult({
    this.globalDecks,
    this.failure
  });
}