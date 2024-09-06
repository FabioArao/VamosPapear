// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/providers/card_provider.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/utils/constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: appTheme,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}