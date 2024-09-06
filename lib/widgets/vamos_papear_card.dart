// widgets/vamos_papear_card.dart

import 'package:flutter/material.dart';

class VamosPapearCard extends StatefulWidget {
  final String question;
  final List<String> categories;

  const VamosPapearCard(
      {Key? key, required this.question, required this.categories})
      : super(key: key);

  @override
  _VamosPapearCardState createState() => _VamosPapearCardState();
}

class _VamosPapearCardState extends State<VamosPapearCard> {
  bool _isFrontVisible = true;

  void _flipCard() {
    setState(() {
      _isFrontVisible = !_isFrontVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        },
        child: _isFrontVisible ? _buildFrontCard() : _buildBackCard(),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Card(
      key: ValueKey<bool>(true),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade300, Colors.blue.shade700],
          ),
        ),
        child: Center(
          child: Text(
            'Vamos Papear',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackCard() {
    return Card(
      key: ValueKey<bool>(false),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 300,
        height: 400,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: widget.categories.map((category) {
                return Chip(
                  label: Text(category),
                  backgroundColor: Colors.blue.shade100,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
