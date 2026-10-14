import 'package:flutter/material.dart';
import '../data/dummy_books.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import '../widgets/stat_item.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final saved = dummyBooks.length;
    final reading =
        dummyBooks.where((b) => b.status == BookStatus.reading).length;
    final finished =
        dummyBooks.where((b) => b.status == BookStatus.finished).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search your library',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatItem(value: '$saved', label: 'Saved'),
              StatItem(value: '$reading', label: 'Reading'),
              StatItem(value: '$finished', label: 'Finished'),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Your books'),
          const SizedBox(height: 16),
          for (final book in dummyBooks) BookCard(book: book),
        ],
      ),
    );
  }
}