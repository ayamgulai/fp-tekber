import 'package:flutter/material.dart';
import '../models/bookModels.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;

  BookDetailPage({required this.book});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late int currentPages;

  @override
  void initState() {
    super.initState();
    currentPages = widget.book.pageNow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
        backgroundColor: Color(0xFFCADBFF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    widget.book.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.book, color: Color(0xFF3D6CD3)),
                const SizedBox(width: 8),
                Text(
                  "$currentPages / ${widget.book.pages} pages",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showUpdateProgressDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCADBFF),
                foregroundColor: Colors.black,
              ),
              child: const Text("Update Progress"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _deleteBookProgress();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red color for delete
                foregroundColor: Colors.white,
              ),
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateProgressDialog(BuildContext context) {
    TextEditingController controller = TextEditingController(text: currentPages.toString());
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Progress'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Pages Read',
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    int newPagesRead = int.tryParse(controller.text) ?? 0;
                    if (newPagesRead <= widget.book.pages) {
                      setState(() {
                        currentPages = newPagesRead;
                        widget.book.pageNow = newPagesRead;
                      });
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text("Pages read cannot exceed total pages.")),
                      );
                    }
                  },
                  child: const Text('Update'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // Function to handle deleting the book progress
  void _deleteBookProgress() {
    setState(() {
      currentPages = 0; //
      widget.book.pageNow = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Book progress has been deleted.")),
    );
  }
}
