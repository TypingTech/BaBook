import 'package:flutter/material.dart';
import '../data/dummy_books.dart';
import '../widgets/book_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search books',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Popular books'),
          const SizedBox(height: 16),
          for (final book in dummyBooks) BookCard(book: book),
        ],
      ),
    );
  }
}