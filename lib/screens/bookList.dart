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
        title: const Text(
          'FP Tekber',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: filteredBooks.length,
        itemBuilder: (context, index) {
          final book = filteredBooks[index];
          return Card(
            color: const Color(0xFFCADBFF),
            child: ListTile(
              title: Text(
                book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                book.types.toString().split('.').last,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/booksDetail', arguments: book);
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
              backgroundColor: const Color(0xFFCADBFF),
              child: const Icon(Icons.add),
            ),
    );
  }
}
