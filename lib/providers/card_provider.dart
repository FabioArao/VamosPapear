// providers/card_provider.dart

import 'package:flutter/foundation.dart';
import 'package:myapp/models/card.dart';
import 'package:myapp/utils/database_helper.dart';

class CardProvider with ChangeNotifier {
  List<Card> _cards = [];
  List<Card> _currentCards = [];
  String _selectedCategory = '';
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<Card> get currentCards => _currentCards;
  String get selectedCategory => _selectedCategory;

  Future<void> loadCards() async {
    _cards = await _databaseHelper.getCards();
    _updateCurrentCards();
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    _updateCurrentCards();
    notifyListeners();
  }

  void _updateCurrentCards() {
    _currentCards = _selectedCategory.isEmpty
        ? List.from(_cards)
        : _cards
            .where((card) => card.categories.contains(_selectedCategory))
            .toList();
    _currentCards.shuffle();
  }

  Future<void> addCard(Card card) async {
    await _databaseHelper.insertCard(card);
    _cards.add(card);
    _updateCurrentCards();
    notifyListeners();
  }

  Future<void> updateCard(Card card) async {
    await _databaseHelper.updateCard(card);
    int index = _cards.indexWhere((c) => c.id == card.id);
    if (index != -1) {
      _cards[index] = card;
      _updateCurrentCards();
      notifyListeners();
    }
  }

  Future<void> removeCard(int cardId) async {
    await _databaseHelper.deleteCard(cardId);
    _cards.removeWhere((card) => card.id == cardId);
    _updateCurrentCards();
    notifyListeners();
  }
}
