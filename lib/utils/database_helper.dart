// utils/database_helper.dart

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapp/models/card.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/utils/constants.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'vamos_papear.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableCards(
        $columnCardId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCardQuestion TEXT NOT NULL,
        $columnCardCategories TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableCategories(
        $columnCategoryId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCategoryName TEXT NOT NULL,
        $columnCategoryDescription TEXT,
        $columnCategoryIconPath TEXT NOT NULL
      )
    ''');

    // Insert initial categories
    for (var category in initialCategories) {
      await db.insert(tableCategories, category.toMap());
    }
  }

  // Card methods
  Future<List<Card>> getCards() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableCards);
    return List.generate(maps.length, (i) => Card.fromMap(maps[i]));
  }

  Future<void> insertCard(Card card) async {
    final db = await database;
    await db.insert(tableCards, card.toMap());
  }

  Future<void> updateCard(Card card) async {
    final db = await database;
    await db.update(
      tableCards,
      card.toMap(),
      where: '$columnCardId = ?',
      whereArgs: [card.id],
    );
  }

  Future<void> deleteCard(int id) async {
    final db = await database;
    await db.delete(
      tableCards,
      where: '$columnCardId = ?',
      whereArgs: [id],
    );
  }

  // Category methods
  Future<List<Category>> getCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableCategories);
    return List.generate(maps.length, (i) => Category.fromMap(maps[i]));
  }

  Future<void> insertCategory(Category category) async {
    final db = await database;
    await db.insert(tableCategories, category.toMap());
  }

  Future<void> updateCategory(Category category) async {
    final db = await database;
    await db.update(
      tableCategories,
      category.toMap(),
      where: '$columnCategoryId = ?',
      whereArgs: [category.id],
    );
  }

  Future<void> deleteCategory(int id) async {
    final db = await database;
    await db.delete(
      tableCategories,
      where: '$columnCategoryId = ?',
      whereArgs: [id],
    );
  }
}
