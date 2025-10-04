import '../../../domain/entities/UserDeckProgress.dart' as domain;
import '../../../generated/user_deck_progress/user_deck_progress.pb.dart' as proto;
import '../../../generated/user_deck_progress/google/protobuf/timestamp.pb.dart' as time;
import 'package:fixnum/fixnum.dart';
DateTime mapTimestampToDateTime(time.Timestamp ts) {
  return DateTime.fromMillisecondsSinceEpoch(
    ts.seconds.toInt() * 1000 + (ts.nanos ~/ 1000000),
    isUtc: true,
  );
}
time.Timestamp mapDateTimeToTimestamp(DateTime dt) {
  return time.Timestamp(
    seconds: Int64(dt.millisecondsSinceEpoch ~/ 1000),
    nanos: ((dt.millisecondsSinceEpoch % 1000) * 1000000).toInt(),
  );
}
List<domain.UserDeckProgress> mapProtoUserDeckProgressToDomain(List<proto.UserDeckProgress>? userDeckProgressList) {
  if (userDeckProgressList == null) return [];

  return userDeckProgressList.map((protoProgress) {
    return domain.UserDeckProgress(
      userID: protoProgress.userId,
      deckID: protoProgress.deckId,
      title: protoProgress.title,
      description: protoProgress.description,
      lastReviewedAt: protoProgress.hasLastReviewedAt()
          ? mapTimestampToDateTime(protoProgress.lastReviewedAt)
          : null, // <-- теперь null, а не 0
      score: protoProgress.score,
    );
  }).toList();
}
List<proto.UserDeckProgress> mapDomainUserDeckProgressToProto(List<domain.UserDeckProgress>? domainList) {
  if (domainList == null) return [];

  return domainList.map((domainProgress) {
    final protoProgress = proto.UserDeckProgress()
      ..userId = domainProgress.userID
      ..deckId = domainProgress.deckID
      ..title = domainProgress.title
      ..description = domainProgress.description
      ..score = domainProgress.score;

    if (domainProgress.lastReviewedAt != null) {
      protoProgress.lastReviewedAt = mapDateTimeToTimestamp(domainProgress.lastReviewedAt!);
    }

    return protoProgress;
  }).toList();
}
