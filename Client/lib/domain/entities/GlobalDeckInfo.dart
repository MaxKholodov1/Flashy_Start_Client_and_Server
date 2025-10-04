import 'package:flashy_start/domain/entities/GlobalDeck.dart';


class GlobalDeckInfo {
  final searchResultDeck globalDeck;
  final String authorName;
  final List<String>? editorNames;
  GlobalDeckInfo({
    required this.globalDeck,
    required this.authorName,
    required this.editorNames
  });
}