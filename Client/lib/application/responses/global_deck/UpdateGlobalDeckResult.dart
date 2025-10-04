import 'package:flashy_start/domain/entities/GlobalDeck.dart';

import '../../../domain/failures/failures.dart';


class UpdateGlobalDeckResult {
  final searchResultDeck? conflictDeck;
  final bool? isSuccess ;
  final Failure? failure;
  UpdateGlobalDeckResult({
    this.conflictDeck,
    this.failure,
    this.isSuccess
  });
}