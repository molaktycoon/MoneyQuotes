import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class Quote {
  final String text;
  final String author;
  bool liked;

  Quote(this.text, this.author, {this.liked = false});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Quote> quotes = [
    Quote('Be yourself; everyone else is already taken.', 'Oscar Wilde'),
    Quote(
        "You know you're in love when you can't fall asleep because reality is finally better than your dreams.",
        'Dr. Seuss'),
    Quote(
        'In three words I can sum up everything I’ve learned about life: it goes on.',
        'Robert Frost'),
    Quote(
        'The only way to do great work is to love what you do.', 'Steve Jobs'),
    Quote('You miss 100% of the shots you don’t take.', 'Wayne Gretzky'),
    Quote('If you want to be rich simply serve more people', 'Robert Kiyosaki'),
    Quote('Fortune sides with him who dares.', 'Virgil'),
    Quote('Never spend your money before you have it.', 'Thomas Jefferson'),
    Quote('Money is a reward for solving problems.', 'Mike Murdock'),
    Quote('Money is usually attracted, not pursued', 'Jim Rohn'),
    Quote(
        'The reason I’ve been able to be so financially successful is my focus has never, ever for one minute been money.',
        'Oprah Winfrey'),
    Quote(
        'You must gain control over your money or the lack of it will forever control you.',
        'Dave Ramsey'),
    Quote(
        'It is not how much you earn but what you do with it that determines your end.',
        'Olumide Emmanuel'),
  ];

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

  // void _toggleLiked(Quote quote) {
  //   setState(() {
  //     quote.liked = !quote.liked;
  //   });
  // }

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

class QuoteListScreen extends StatelessWidget {
  final List<Quote> quotes;

  const QuoteListScreen(this.quotes, {super.key});

  void _showDetails(BuildContext context, Quote quote) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(quote.author),
        content: Text(quote.text),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteItem(BuildContext context, int index) {
    final quote = quotes[index];
    final icon = quote.liked ? Icons.favorite : Icons.favorite_border;

    return ListTile(
      title: Text(quote.text),
      subtitle: Text(quote.author),
      trailing: IconButton(
        icon: Icon(icon),
        onPressed: () => _toggleLiked(quote),
      ),
      onTap: () => _showDetails(context, quote),
    );
  }

  void _toggleLiked(Quote quote) {
    quote.liked = !quote.liked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Quotes'),
      ),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: _buildQuoteItem,
      ),
    );
  }
}
