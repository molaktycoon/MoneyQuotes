import 'package:flutter/material.dart';
import 'home_screen_view.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuoteApp());
}



class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MONEY QUOTE',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

