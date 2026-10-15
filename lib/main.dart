import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BaBook',
      debugShowCheckedModeBanner: false,
      home: MainShell(),
    );
  }
}

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(subtitle: 'Library'),
            Divider(height: 1),
            Expanded(child: LibraryPage()),
          ],
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  final String subtitle;
  const AppHeader({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BaBook',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(subtitle, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const CircleAvatar(radius: 17, child: Text('A')),
        ],
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final saved = dummyBooks.length;
    final reading = dummyBooks
        .where((b) => b.status == BookStatus.reading)
        .length;
    final finished = dummyBooks
        .where((b) => b.status == BookStatus.finished)
        .length;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      children: [
        const Text(
          'My Library',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        const Text(
          'All the books you have saved.',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'Search your library',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 24),
        StatsCard(saved: saved, reading: reading, finished: finished),
        const SizedBox(height: 28),
        const Text('Your books', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 14),
        ...dummyBooks.map(
          (b) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: BookCard(book: b),
          ),
        ),
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  final int saved, reading, finished;
  const StatsCard({
    super.key,
    required this.saved,
    required this.reading,
    required this.finished,
  });

  Widget _item(int value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$value',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            _item(saved, 'Saved'),
            const SizedBox(height: 36, child: VerticalDivider()),
            _item(reading, 'Reading'),
            const SizedBox(height: 36, child: VerticalDivider()),
            _item(finished, 'Finished'),
          ],
        ),
      ),
    );
  }
}

enum BookStatus { reading, finished, saved }

class Book {
  final String title;
  final String author;
  final BookStatus status;
  final int progress;

  const Book({
    required this.title,
    required this.author,
    required this.status,
    this.progress = 0,
  });
}

const List<Book> dummyBooks = [
  Book(
    title: 'The Secret Garden',
    author: 'Frances Hodgson Burnett',
    status: BookStatus.reading,
    progress: 62,
  ),
  Book(
    title: 'Atomic Habits',
    author: 'James Clear',
    status: BookStatus.finished,
  ),
  Book(
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    status: BookStatus.finished,
  ),
  Book(title: 'Deep Work', author: 'Cal Newport', status: BookStatus.saved),
];

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

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
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const SizedBox(width: 43, height: 58, child: Icon(Icons.menu_book)),
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
    );
  }
}
