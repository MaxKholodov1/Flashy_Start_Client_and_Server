class GlobalCard {
  final int ID;
  final int deckID;
  final String question;
  final String answer;
  final int authorID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  GlobalCard ({
    required this.ID,
    required this.deckID,
    required this.question,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
    required this.authorID,
    required this.version,
  });
}