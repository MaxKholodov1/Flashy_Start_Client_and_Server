import 'package:fixnum/fixnum.dart' ;

import '../../../domain/entities/RecallQualityEnum.dart';
import '../../../domain/entities/UserCardProgress.dart' as domain;
import '../../../domain/entities/ShortTermMemoryEnum.dart' as domainEnum;

import '../../../generated/user_progress_card/google/protobuf/timestamp.pb.dart' show Timestamp;
import '../../../generated/user_progress_card/user_progress_card.pb.dart' as proto;

Timestamp? _mapDateTimeToProtoTimestamp(DateTime? dt) {
  if (dt == null) return null;
  final seconds = dt.toUtc().millisecondsSinceEpoch ~/ 1000;
  final nanos = (dt.toUtc().microsecondsSinceEpoch % 1000000) * 1000;
  return Timestamp()..seconds = Int64(seconds)..nanos = nanos;
}

List<proto.UserProgressCard> mapDomainToProtoUserProgressCards(List<domain.UserProgressCard> domainList) {
  return domainList.map((domainCard) {
    final protoCard = proto.UserProgressCard()
      ..userId = domainCard.userID
      ..cardId = domainCard.cardID
      ..question = domainCard.question
      ..answer = domainCard.answer
      ..shortTermMemory = mapDomainToProtoShortTermMemory(domainCard.shortTermMemory)
      ..longTermMemory = domainCard.longTermMemory
      ..repetitionCount = domainCard.repetitionCount
      ..deckId = domainCard.deckID;

    if (domainCard.nextReviewDate != null) {
      protoCard.nextReviewDate = _mapDateTimeToProtoTimestamp(domainCard.nextReviewDate)!;
    }
    if (domainCard.lastReviewedAt != null) {
      protoCard.lastReviewedAt = _mapDateTimeToProtoTimestamp(domainCard.lastReviewedAt)!;
    }

    return protoCard;
  }).toList();
}


DateTime? _mapProtoTimestampToDateTime(Timestamp? ts) {
  if (ts == null || ts.seconds == 0) return null;
  return DateTime.fromMillisecondsSinceEpoch(
    ts.seconds.toInt() * 1000 + (ts.nanos ~/ 1000000),
    isUtc: true,
  );
}

List<domain.UserProgressCard> mapProtoToDomainUserProgressCards(List<proto.UserProgressCard> protoList) {
  return protoList.map((protoCard) {
    return domain.UserProgressCard(
      userID: protoCard.userId,
      cardID: protoCard.cardId,
      question: protoCard.question,
      answer: protoCard.answer,
      nextReviewDate: _mapProtoTimestampToDateTime(protoCard.hasNextReviewDate() ? protoCard.nextReviewDate : null),
      lastReviewedAt: _mapProtoTimestampToDateTime(protoCard.hasLastReviewedAt() ? protoCard.lastReviewedAt : null),
      shortTermMemory: domainEnum.ShortTermMemory.fromInt(protoCard.shortTermMemory.value),
      longTermMemory: protoCard.longTermMemory,
      repetitionCount: protoCard.repetitionCount,
      deckID: protoCard.deckId,
    );
  }).toList();
}
proto.RecallQuality mapDomainToProtoRecallQuality(RecallQuality quality) {
  switch (quality) {
    case RecallQuality.bad:
      return proto.RecallQuality.BAD;
    case RecallQuality.normal:
      return proto.RecallQuality.NORMAL;
    case RecallQuality.good:
      return proto.RecallQuality.GOOD;
    case RecallQuality.perfect:
      return proto.RecallQuality.PERFECT;
    }
}
proto.ShortTermMemory mapDomainToProtoShortTermMemory(domainEnum.ShortTermMemory memory) {
  switch (memory) {
    case domainEnum.ShortTermMemory.unknown:
      return proto.ShortTermMemory.STM_UNKNOWN;
    case domainEnum.ShortTermMemory.bad:
      return proto.ShortTermMemory.STM_BAD;
    case domainEnum.ShortTermMemory.normal:
      return proto.ShortTermMemory.STM_NORMAL;
    case domainEnum.ShortTermMemory.good:
      return proto.ShortTermMemory.STM_GOOD;
    case domainEnum.ShortTermMemory.perfect:
      return proto.ShortTermMemory.STM_PERFECT;
    }
}