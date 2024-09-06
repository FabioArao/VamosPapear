// screens/category_screen.dart

import 'package:flutter/material.dart';
import 'package:myapp/screens/card_screen.dart';
import 'package:myapp/widgets/catrgory_card.dart';
import 'package:myapp/utils/constants.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Papear'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to profile screen (not implemented yet)
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: initialCategories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: initialCategories[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CardScreen(category: initialCategories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
