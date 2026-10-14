import 'package:flutter/material.dart';
import '../models/book.dart';
import '../pages/book_detail_page.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.menu_book),
        title: Text(book.title),
        subtitle: Text(book.author),
        trailing: Text(book.statusLabel),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => BookDetailPage(book: book)),
          );
        },
      ),
    );
  }
}