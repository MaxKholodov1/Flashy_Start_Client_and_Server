
import '../../../domain/entities/GlobalCard.dart' as domain;
import '../../../generated/global_card/global_card.pb.dart' as proto;
import '../../../generated/global_card/google/protobuf/timestamp.pb.dart';

DateTime mapTimestampToDateTime(Timestamp ts) {
  return DateTime.fromMillisecondsSinceEpoch(
    ts.seconds.toInt() * 1000 + (ts.nanos ~/ 1000000),
    isUtc: true,
  );
}

domain.GlobalCard mapProtoGlobalCardToDomain(proto.GlobalCard protoCard) {
  return domain.GlobalCard(
    ID: protoCard.id,
    deckID: protoCard.deckID,
    question: protoCard.question,
    answer: protoCard.answer,
    createdAt: mapTimestampToDateTime(protoCard.createdAt),
    updatedAt: mapTimestampToDateTime(protoCard.updatedAt) ,
    authorID: protoCard.authorID,
    version: protoCard.version,
  );
}
List<domain.GlobalCard> mapProtoGlobalCardsToDomain(List<proto.GlobalCard>? protoCards) {
  if (protoCards == null) return [];
  return protoCards
      .map((protoCard) => mapProtoGlobalCardToDomain(protoCard))
      .toList();
}