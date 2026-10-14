import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/stat_item.dart';
import 'book_reader_page.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Detail')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(child: Icon(Icons.menu_book)),
          const SizedBox(height: 16),
          Center(child: Text(book.title)),
          Center(child: Text('by ${book.author}')),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatItem(value: '${book.year}', label: 'Published'),
              StatItem(value: '${book.pages}', label: 'Pages'),
              StatItem(value: book.language, label: 'Language'),
            ],
          ),
          const SizedBox(height: 16),
          const Text('About this book'),
          const SizedBox(height: 16),
          Text(book.description),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookReaderPage(book: book),
                ),
              );
            },
            child: const Text('Read book'),
          ),
        ],
      ),
    );
  }
}