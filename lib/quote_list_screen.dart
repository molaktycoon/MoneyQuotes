import 'package:flutter/material.dart';
import 'model/quote_model.dart';


class QuoteListScreen extends StatefulWidget {
  final List<Quote> quotes;

const QuoteListScreen(this.quotes, {Key key = const Key('quoteList')}) : super(key: key);

  @override
  QuoteListScreenState createState() => QuoteListScreenState();
}

class QuoteListScreenState extends State<QuoteListScreen> {
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

  void _toggleLiked(int index) {
    setState(() {
      widget.quotes[index].liked = !widget.quotes[index].liked;
    });
  }

  Widget _buildQuoteItem(BuildContext context, int index) {
    final quote = widget.quotes[index];
    final icon = quote.liked ? Icons.favorite : Icons.favorite_border;

    return ListTile(
      title: Text(quote.text),
      subtitle: Text(quote.author),
      trailing: IconButton(
        icon: Icon(icon),
        onPressed: () => _toggleLiked(index),
      ),
      onTap: () => _showDetails(context, quote),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Quotes'),
      ),
      body: ListView.builder(
        itemCount: widget.quotes.length,
        itemBuilder: _buildQuoteItem,
      ),
    );
  }
}












// class QuoteListScreen extends StatelessWidget {
//   final List<Quote> quotes;

//   const QuoteListScreen(this.quotes, {super.key});

//   void _showDetails(BuildContext context, Quote quote) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(quote.author),
//         content: Text(quote.text),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuoteItem(BuildContext context, int index) {
//     final quote = quotes[index];
//     final icon = quote.liked ? Icons.favorite : Icons.favorite_border;

//     return ListTile(
//       title: Text(quote.text),
//       subtitle: Text(quote.author),
//       trailing: IconButton(
//         icon: Icon(icon),
//         onPressed: () => _toggleLiked(quote),
//       ),
//       onTap: () => _showDetails(context, quote),
//     );
//   }

//   void _toggleLiked(Quote quote) {
//     quote.liked = !quote.liked;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('All Quotes'),
//       ),
//       body: ListView.builder(
//         itemCount: quotes.length,
//         itemBuilder: _buildQuoteItem,
//       ),
//     );
//   }
// }
