// utils/constants.dart

import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';

// Database constants
const String tableCards = 'cards';
const String tableCategories = 'categories';

// Card table column names
const String columnCardId = 'id';
const String columnCardQuestion = 'question';
const String columnCardCategories = 'categories';

// Category table column names
const String columnCategoryId = 'id';
const String columnCategoryName = 'name';
const String columnCategoryDescription = 'description';
const String columnCategoryIconPath = 'iconPath';

// App constants
const String appName = 'Vamos Papear';
const int initialFreeCardsPerCategory = 30;
const int paidCardsPerCategory = 150;

// Initial categories
final List<Category> initialCategories = [
  Category(
    id: 1,
    name: 'Quebra Gelo',
    description: 'Perguntas para iniciar conversas e quebrar o gelo.',
    iconPath: 'assets/icons/ice_breaker.png',
  ),
  Category(
    id: 2,
    name: 'Conversa filosófica',
    description: 'Perguntas para estimular reflexões profundas.',
    iconPath: 'assets/icons/philosophy.png',
  ),
  Category(
    id: 3,
    name: 'Conversa pra casais',
    description: 'Perguntas para fortalecer relacionamentos.',
    iconPath: 'assets/icons/couple.png',
  ),
  Category(
    id: 4,
    name: 'Fatos aleatórios',
    description: 'Curiosidades interessantes para compartilhar.',
    iconPath: 'assets/icons/random_facts.png',
  ),
  Category(
    id: 5,
    name: 'Conversa para novos amigos',
    description: 'Perguntas para conhecer melhor novas pessoas.',
    iconPath: 'assets/icons/new_friends.png',
  ),
  Category(
    id: 6,
    name: 'Remix',
    description: 'Uma mistura de todas as categorias.',
    iconPath: 'assets/icons/remix.png',
  ),
];

// Theme data
final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16),
  ),
);