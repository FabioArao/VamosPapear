// screens/category_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/providers/card_provider.dart';
import 'package:myapp/screens/card_screen.dart';
import 'package:myapp/widgets/catrgory_card.dart';
import 'package:myapp/utils/constants.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos Papear'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to profile screen (not implemented yet)
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
