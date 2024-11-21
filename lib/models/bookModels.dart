enum Types {novel, education, references, other}

class Book {
  final String title;
  final Types types;
  final int pages;
  int pageNow;
  final bool isCompleted;

  Book({
    required this.title,
    required this.types,
    required this.pages,
    required this.pageNow,
    required this.isCompleted,
  });

  void updatePageNow(int newPage) {
    pageNow = newPage;
  }
  
}