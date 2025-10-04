import 'package:flashy_start/domain/failures/failures.dart';

import '../../../domain/entities/User.dart';

class GetUserResult {
  final User? user;
  final Failure? failure;
  GetUserResult({
    this.user,
    this.failure
  });
}