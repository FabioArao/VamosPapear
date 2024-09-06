// models/card.dart

import 'package:flutter/foundation.dart';

class Card {
  final int id;
  final String question;
  final List<String> categories;

  Card({
    required this.id,
    required this.question,
    required this.categories,
  });

  Card.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        question = map['question'],
        categories = List<String>.from(map['categories']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'categories': categories,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Card &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          question == other.question &&
          listEquals(categories, other.categories);

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ categories.hashCode;

  @override
  String toString() {
    return 'Card{id: $id, question: $question, categories: $categories}';
  }
}