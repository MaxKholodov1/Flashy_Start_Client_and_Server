import '../../../domain/entities/GlobalCard.dart';
import '../../../domain/failures/failures.dart';

class UpdateGlobalCardResult {
  final GlobalCard? conflictCard;
  final bool? isSuccess ;
  final Failure? failure;
  UpdateGlobalCardResult({
    this.conflictCard,
    this.failure,
    this.isSuccess
  });
}