import 'package:flutter/material.dart';
import '../data/bookData.dart';

class BookListPage extends StatelessWidget {
  final bool isCompleted;

  BookListPage({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    final filteredBooks =
        books.where((book) => book.isCompleted == isCompleted).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reading List'),
      ),
      body: ListView.builder(
        itemCount: filteredBooks.length,
        itemBuilder: (context, index) {
          final books = filteredBooks[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              color: const Color.fromARGB(255, 188, 223, 255),
              child: ListTile(
                title: Text(
                  books.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  books.types.toString().split('.').last,
                ),
                trailing: Text(
                  //hitung persentase
                  '${((books.pageNow / books.pages) * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 110, 255),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/booksDetail', arguments: books);
                },
              ),
            ),
          );

        },
      ),
      floatingActionButton: isCompleted
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addBook');
              },
              backgroundColor: const Color.fromARGB(255, 0, 110, 255),
              child: const Icon(Icons.add, color: Colors.white),
            ),
    );
  }
}
