// screens/admin_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/card.dart';
import 'package:myapp/providers/card_provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _categoriesController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    _categoriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel Administrativo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _questionController,
                decoration: const InputDecoration(labelText: 'Pergunta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma pergunta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoriesController,
                decoration: const InputDecoration(
                    labelText: 'Categorias (separadas por vírgula)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira pelo menos uma categoria';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newCard = Card(
                      id: DateTime.now().millisecondsSinceEpoch,
                      question: _questionController.text,
                      categories: _categoriesController.text
                          .split(',')
                          .map((category) => category.trim())
                          .where((category) => category.isNotEmpty)
                          .toList(),
                    );
                    cardProvider.addCard(newCard);
                    _questionController.clear();
                    _categoriesController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Carta adicionada com sucesso!')),
                    );
                  }
                },
                child: const Text('Adicionar Carta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}