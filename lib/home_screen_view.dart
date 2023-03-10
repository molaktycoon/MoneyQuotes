import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moneyquotes/main.dart';
import 'package:moneyquotes/quotes.dart';

import 'quote_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Quote _currentQuote;
  @override
  void initState() {
    super.initState();
    _currentQuote = quotes[Random().nextInt(quotes.length)];
  }

  void _generateQuote() {
    setState(() {
      _currentQuote = quotes[Random().nextInt(quotes.length)];
    });
  }

  void _viewAllQuotes() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuoteListScreen(quotes)),
    );
  }

  void toggleLiked(Quote quote) {
    setState(() {
      quote.liked = !quote.liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/logo.jpg',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: const Text(
                'Random Quote',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _currentQuote.text,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              _currentQuote.author,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _generateQuote,
              child: const Text('Get a Quote'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _viewAllQuotes,
              child: const Text('View All Quotes'),
            ),
          ],
        ),
      ),
    );
  }
}

