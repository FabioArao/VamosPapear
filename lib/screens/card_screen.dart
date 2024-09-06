// screens/card_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/providers/card_provider.dart';
import 'package:myapp/widgets/vamos_papear_card.dart';

class CardScreen extends StatelessWidget {
  final Category category;

  const CardScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to profile screen (not implemented yet)
            },
          ),
        ],
      ),
      body: Center(
        child: cardProvider.currentCards.isEmpty
            ? Text('No cards available for ${category.name}')
            : VamosPapearCard(
                question: cardProvider.currentCards.first.question,
                categories: cardProvider.currentCards.first.categories,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cardProvider.setSelectedCategory(category.name);
        },
        tooltip: 'Next Card',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
