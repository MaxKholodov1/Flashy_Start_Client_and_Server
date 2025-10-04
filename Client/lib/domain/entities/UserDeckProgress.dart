class UserDeckProgress{
  final int userID;
  final int deckID;
  final String title;
  final String description;
  final DateTime? lastReviewedAt;
  final int score;
  UserDeckProgress({required this.userID, required this.deckID, required this.title,
  required this.description, this.lastReviewedAt, required this.score});
}