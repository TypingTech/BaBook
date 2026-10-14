import 'package:flutter/material.dart';
import '../models/book.dart';

class BookReaderPage extends StatefulWidget {
  final Book book;

  const BookReaderPage({super.key, required this.book});

  @override
  State<BookReaderPage> createState() => _BookReaderPageState();
}

class _BookReaderPageState extends State<BookReaderPage> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final totalPages = widget.book.pages;

    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: GestureDetector(
        // Swipe left = next page, swipe right = previous page
        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;
          if (velocity < 0 && _currentPage < totalPages) {
            setState(() => _currentPage++);
          } else if (velocity > 0 && _currentPage > 1) {
            setState(() => _currentPage--);
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Chapter One'),
            const SizedBox(height: 16),
            const Text(
              'It was the beginning of a new day. The morning light came '
              'quietly through the window, filling the room with a soft, '
              'warm glow.\n\n'
              'Everything felt still, as though the world was waiting for '
              'something to happen. Outside, the trees moved gently in the '
              'wind and a bird sang somewhere in the distance.\n\n'
              'This was where the story began: with one small decision, one '
              'open door, and the courage to step through it.\n\n'
              'There was no way to know what waited on the other side, but '
              'staying in the same place no longer felt possible.',
            ),
            const SizedBox(height: 16),
            Center(child: Text('Page $_currentPage of $totalPages')),
            const SizedBox(height: 16),
            LinearProgressIndicator(value: _currentPage / totalPages),
          ],
        ),
      ),
    );
  }
}