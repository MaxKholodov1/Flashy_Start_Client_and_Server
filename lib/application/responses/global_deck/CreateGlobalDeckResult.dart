import 'package:flashy_start/domain/failures/failures.dart';

class CreateGlobalDeckResult{
  final int? globalDeckID;
  final Failure? failure;

  const CreateGlobalDeckResult({
    this.globalDeckID,
    this.failure
  });
}