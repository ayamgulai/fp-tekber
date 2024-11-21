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
          style: TextStyle(color: Colors.black), // Warna teks hitam
        ),
        backgroundColor: Colors.white, // Warna AppBar putih
        elevation: 0, // Hilangkan bayangan AppBar
        iconTheme: const IconThemeData(color: Colors.black), // Warna ikon hitam
      ),
      backgroundColor: Colors.white, // Warna latar Scaffold putih
      body: ListView.builder(
        itemCount: filteredBooks.length,
        itemBuilder: (context, index) {
          final book = filteredBooks[index];
          return Card(
            color: const Color(0xFFCADBFF), // Warna kartu tetap sama
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
              backgroundColor: const Color(0xFFCADBFF), // Warna tombol tetap
              child: const Icon(Icons.add),
            ),
    );
  }
}
