import 'package:flashy_start/domain/failures/failures.dart';

class CreateGlobalCardResult{
  final int? globalCardID;
  final Failure? failure;

  const CreateGlobalCardResult({
    this.globalCardID,
    this.failure
  });
}