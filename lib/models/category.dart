// models/category.dart

import 'package:flutter/foundation.dart';

class Category {
  final int id;
  final String name;
  final String description;
  final String iconPath;

  Category({
    required this.id,
    required this.name,
    this.description = '',
    required this.iconPath,
  });

  Category.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        description = map['description'] ?? '',
        iconPath = map['iconPath'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconPath': iconPath,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          iconPath == other.iconPath;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ description.hashCode ^ iconPath.hashCode;

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description, iconPath: $iconPath}';
  }
}
