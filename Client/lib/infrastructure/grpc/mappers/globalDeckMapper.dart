import 'package:flashy_start/domain/entities/GlobalDeck.dart' as domain;
import 'package:flashy_start/generated/global_deck/global_deck.pb.dart' as proto;

extension GlobalDeckMapper on proto.GlobalDeck{
  domain.searchResultDeck toDomain(){
    return domain.searchResultDeck(
      ID: id,
      title: title,
      description: description,
      authorID: authorID,
      createdAt: createdAt.toDateTime(),
      updatedAt: updatedAt.toDateTime(),
      isPublic: isPublic,
      tags: tags,
      version: version
    );
  }
}