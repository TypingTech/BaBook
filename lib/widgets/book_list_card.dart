import 'package:flutter/material.dart';
import '../models/book.dart';

class BookListCard extends StatelessWidget {
  final Book book;
  final VoidCallback? onTap;

  const BookListCard({super.key, required this.book, this.onTap});

  String get _statusText {
    switch (book.status) {
      case BookStatus.reading:
        return 'Reading · ${book.progress}%';
      case BookStatus.finished:
        return 'Finished';
      case BookStatus.saved:
        return 'Saved';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              const SizedBox(
                width: 43,
                height: 58,
                child: Icon(Icons.menu_book),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.title, style: const TextStyle(fontSize: 13)),
                    const SizedBox(height: 4),
                    Text(book.author, style: const TextStyle(fontSize: 9)),
                    const SizedBox(height: 10),
                    Text(
                      _statusText,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}