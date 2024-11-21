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
        backgroundColor: Colors.orangeAccent,
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
                  Text(
                    'by ${widget.book.author ?? "Unknown Author"}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF616161),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: const Text(
                "BOOK DESCRIPTION",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            _parseDescription(widget.book.description ?? "No description available."),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.date_range, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  "First published ${widget.book.publicationDate ?? "Unknown"}",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.book, color: Colors.grey),
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
              child: const Text("Update Progress"),
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
        );
      },
    );
  }
}

Text _parseDescription(String description) {
  List<TextSpan> textSpans = [];
  RegExp regExp = RegExp(r"\*\*(.*?)\*\*");
  
  int lastIndex = 0;
  regExp.allMatches(description).forEach((match) {
    if (match.start > lastIndex) {
      textSpans.add(TextSpan(
        text: description.substring(lastIndex, match.start),
        style: TextStyle(fontWeight: FontWeight.normal),
      ));
    }
    
    textSpans.add(TextSpan(
      text: match.group(1),
      style: TextStyle(fontWeight: FontWeight.bold),
    ));
    
    lastIndex = match.end;
  });
  
  if (lastIndex < description.length) {
    textSpans.add(TextSpan(
      text: description.substring(lastIndex),
      style: TextStyle(fontWeight: FontWeight.normal),
    ));
  }

  return Text.rich(TextSpan(children: textSpans));
}
