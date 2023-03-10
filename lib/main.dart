import 'package:flutter/material.dart';
import 'home_screen_view.dart';

void main() {
  runApp(const QuoteApp());
}

class Quote {
  final String text;
  final String author;
  bool liked;

  Quote(this.text, this.author, {this.liked = false});
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MONEY QUOTE',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

