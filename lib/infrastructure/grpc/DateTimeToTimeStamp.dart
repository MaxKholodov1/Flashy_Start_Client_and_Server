import 'package:fixnum/fixnum.dart';
import '../../generated/global_deck/google/protobuf/timestamp.pb.dart';

Timestamp dateTimeToTimestamp(DateTime dateTime) {
  return Timestamp()
    ..seconds = Int64(dateTime.toUtc().millisecondsSinceEpoch ~/ 1000)
    ..nanos = (dateTime.toUtc().microsecond % 1000000) * 1000;
}
