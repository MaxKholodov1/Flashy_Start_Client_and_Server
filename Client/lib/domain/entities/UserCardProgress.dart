import 'dart:core';

import 'ShortTermMemoryEnum.dart';

class UserProgressCard{
  final int userID;
  final int cardID;
  final String question;
  final String answer;
  final DateTime? nextReviewDate;
  final DateTime? lastReviewedAt;
  final ShortTermMemory shortTermMemory;
  final int longTermMemory;
  final int repetitionCount;
  final int deckID;
  UserProgressCard ({required this.userID, required this.cardID, required this.repetitionCount,
  required this.question, required this.answer, this.nextReviewDate, required this.deckID,
  this.lastReviewedAt, required this.shortTermMemory, required this.longTermMemory,});
}