enum Types {novel, education, references, other}

class Book {
  final String title;
  final String? author;
  final Types types;
  final int pages;
  int pageNow;
  final bool isCompleted;
  final String? description;
  final String? publicationDate; 

  Book({
    required this.title,
    required this.author,
    required this.types,
    required this.pages,
    required this.pageNow,
    required this.isCompleted,
    this.description,
    this.publicationDate,
  });

  void updatePageNow(int newPage) {
    pageNow = newPage;
  }
  
}