enum Types { novel, education, references, other }

class Book {
  final String title;
  final Types types;
  final int pages;
  int pageNow; // Optional with default value
  bool isCompleted;
  final String? note; // Optional note
  final DateTime dateAdded; // Automatically set to today's date
  DateTime dateFinished;

  Book({
    required this.title,
    required this.types,
    required this.pages,
    this.pageNow = 0, // Default value for pageNow
    this.isCompleted = false, // Default to false
    this.note, // Optional note
    DateTime? dateAdded, // Optional, auto-filled with today's date
    DateTime? dateFinished, // Optional dateFinished with default
  })  : dateAdded = dateAdded ?? DateTime.now(), // Default to current date
        dateFinished = dateFinished ?? DateTime(9999, 12, 31); // Default dateFinished

  void updatePageNow(int newPage) {
    pageNow = newPage;
  }
}
