import 'package:flashy_start/infrastructure/grpc/mappers/globalDeckMapper.dart';

import '../../../domain/entities/SearchGlobalDeck.dart';
import '../../../generated/global_deck/global_deck.pb.dart' as proto;


List<SearchResultDeck> mapToDomainList(proto.SearchGlobalDecksResponse response) {
  return response.results.map((result) {
    return SearchResultDeck(
      globalDeck: result.deck.toDomain(), // используем extension
      isAlreadyAdded: result.isAlreadyAdded,
    );
  }).toList();
}
