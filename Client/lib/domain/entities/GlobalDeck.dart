import 'dart:core';

class searchResultDeck{
  final int ID;
  final String title;
  final String? description;
  final int authorID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPublic;
  final List<String>? tags;
  final int version;
  searchResultDeck({required this.ID,
  required this.title,
  this.description,
    required this.authorID,
    required this.createdAt,
    required this.updatedAt,
    required this.isPublic,
    this.tags,
    required this.version
  });
  searchResultDeck copyInfoWith({
    String? title,
    String? description,
    List<String>? tags,
  }) {
    return searchResultDeck(
      ID:  ID,
      title: title ?? this.title,
      description: description ?? this.description,
      authorID: authorID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isPublic: isPublic,
      tags: tags ?? this.tags,
      version: version
    );
  }
}