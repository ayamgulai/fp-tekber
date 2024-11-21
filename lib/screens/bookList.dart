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
        title: const Text('FP Tekber'),
      ),
      body: ListView.builder(
        itemCount: filteredBooks.length,
        itemBuilder: (context, index) {
          final books = filteredBooks[index];
          return Card(
            color: Colors.orange.shade100,
            child: ListTile(
              title: Text(
                books.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(books.types.toString().split('.').last),
              onTap: () {
                Navigator.pushNamed(context, '/booksDetail', arguments: books);
              },
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
              backgroundColor: Colors.orange,
              child: const Icon(Icons.add),
            ),
    );
  }
}
