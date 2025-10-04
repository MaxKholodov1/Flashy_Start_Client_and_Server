import 'package:flashy_start/domain/entities/GlobalDeck.dart';

import '../../../domain/failures/failures.dart';

class GetGlobalDeckInfoResult {
  final searchResultDeck? globalDeck;
  final String? authorName;
  final List<String>? editorNames;
  final Failure? failure;
  GetGlobalDeckInfoResult({
    this.globalDeck,
    this.failure,
    this.authorName,
    this.editorNames
  });
}