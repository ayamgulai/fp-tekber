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
    bool isCompleted = currentPages >= widget.book.pages;

    return Scaffold(
      appBar: AppBar(
        title: Text(isCompleted ? "Completed Book" : "Book Details"),
        backgroundColor: const Color(0xFFF0F4FF),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isCompleted
            ? _buildCompletedBookView()
            : _buildInProgressBookView(),
      ),
    );
  }

  String formatDate(DateTime date) {
    return "${date.year}/${_addLeadingZero(date.month)}/${_addLeadingZero(date.day)}";
  }

  String _addLeadingZero(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _buildCompletedBookView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book Category
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          child: Text(
            widget.book.types.toString().split('.').last,
            style: const TextStyle(
              color: Color(0xFF636363),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Book Title
        Text(
          widget.book.title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00476A),
          ),
        ),
        const SizedBox(height: 10),

        // Added and Finished Date
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF00476A),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Added at ${formatDate(widget.book.dateAdded)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF00476A),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Finished at ${formatDate(DateTime.now())}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Notes
        Text(
          "Notes:\n${widget.book.note}",
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF00476A),
          ),
        ),
        const SizedBox(height: 40),

        // Delete Button
        ElevatedButton(
          onPressed: _deleteBookProgress,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
            minimumSize: const Size(double.infinity, 50),
            side: const BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.delete,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(width: 8),
              Text("Delete Book"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInProgressBookView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book Category
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          child: Text(
            widget.book.types.toString().split('.').last,
            style: const TextStyle(
              color: Color(0xFF636363),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Book Title
        Text(
          widget.book.title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00476A),
          ),
        ),
        const SizedBox(height: 10),

        // Date Added
        Text(
          "Added at ${formatDate(widget.book.dateAdded)}",
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF00476A),
          ),
        ),
        const SizedBox(height: 5),

        // Notes
        Text(
          "Notes:\n${widget.book.note}",
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF00476A),
          ),
        ),
        const SizedBox(height: 40),

        // Progress Section
        Center(
          child: Column(
            children: [
              const Text(
                "Progress saat ini:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00476A),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Minus Button
                  IconButton(
                    onPressed: () {
                      if (currentPages > 0) {
                        setState(() {
                          currentPages--;
                          widget.book.pageNow = currentPages;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove),
                    color: Color(0xFF00476A),
                    iconSize: 20,
                  ),

                  // Progress Count
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "$currentPages/${widget.book.pages}",
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00476A),
                      ),
                    ),
                  ),

                  // Plus Button
                  IconButton(
                    onPressed: () {
                      if (currentPages < widget.book.pages) {
                        setState(() {
                          currentPages++;
                          widget.book.pageNow = currentPages;
                        });
                      }
                    },
                    icon: const Icon(Icons.add),
                    color: Color(0xFF00476A),
                    iconSize: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Progress Bar
              LinearProgressIndicator(
                value: currentPages / widget.book.pages,
                backgroundColor: Colors.grey[300],
                color: Color(0xFF00476A),
                minHeight: 8,
              ),
              const SizedBox(height: 30),

              // Update Button
              ElevatedButton(
                onPressed: () {
                  _showUpdateProgressDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCADBFF),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.bookmark,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text("Update"),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Delete Button
              ElevatedButton(
                onPressed: _deleteBookProgress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(
                    color: Colors.red,
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text("Delete Book"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showUpdateProgressDialog(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: currentPages.toString());
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Progress'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Pages Read',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                int newPagesRead = int.tryParse(controller.text) ?? 0;
                if (newPagesRead <= widget.book.pages) {
                  setState(() {
                    currentPages = newPagesRead;
                    widget.book.pageNow = newPagesRead;
                    widget.book.isCompleted = currentPages >= widget.book.pages;
                  });
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text("Pages read cannot exceed total pages.")),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteBookProgress() {
  }
}
