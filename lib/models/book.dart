enum BookStatus { saved, reading, finished }

class Book {
  final String title;
  final String author;
  final String description;
  final String language;
  final int year;
  final int pages;
  final BookStatus status;
  final int progress;

  const Book({
    required this.title,
    required this.author,
    required this.description,
    required this.language,
    required this.year,
    required this.pages,
    required this.status,
    this.progress = 0,
  });

  String get statusLabel {
    switch (status) {
      case BookStatus.reading:
        return 'Reading $progress%';
      case BookStatus.finished:
        return 'Finished';
      case BookStatus.saved:
        return 'Saved';
    }
  }
}