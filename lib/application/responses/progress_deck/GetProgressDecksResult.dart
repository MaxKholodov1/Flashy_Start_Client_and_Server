
import 'package:flashy_start/domain/entities/UserDeckProgress.dart';

import '../../../domain/failures/failures.dart';

class GetProgressDecksResult {
  final List<UserDeckProgress>? userDeckProgressList;
  final Failure? failure;
  GetProgressDecksResult({
    this.userDeckProgressList,
    this.failure
  });
}