import 'package:flutter/material.dart';
import '../models/bookModels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;
  final List<Book> bookList;

  BookDetailPage({
    required this.book,
    required this.bookList,
  });

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  _BookDetailPageState();
  late int currentPages;
  bool isUpdated = false;
  late int tempCurrentPages = 0;
  late TextEditingController _pageController;
  bool isCompleted = false;
  late List<Book> bookList;

  @override
  void initState() {
    super.initState();
    currentPages = widget.book.pageNow;
    tempCurrentPages = currentPages;
    _pageController = TextEditingController(text: tempCurrentPages.toString());
    bookList = widget.bookList;
  }

  @override
  Widget build(BuildContext context) {
    bool isCompleted = currentPages >= widget.book.pages;  // Pastikan ini di sini untuk menentukan status selesai atau belum

    return ScaffoldWithWillPop(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                      if (tempCurrentPages > 0) {
                        setState(() {
                          tempCurrentPages--;
                          _pageController.text = tempCurrentPages.toString();
                        });
                      }
                    },
                    icon: const Icon(Icons.remove),
                    color: Color(0xFF00476A),
                    iconSize: 20,
                  ),

                  // Progress Count
                  SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00476A),
                      ),
                      controller: _pageController,
                      onSubmitted: (value) {
                        setState(() {
                          int? newValue = int.tryParse(value);
                          if (newValue != null && newValue >= 0 && newValue <= widget.book.pages) {
                            tempCurrentPages = newValue;
                            _pageController.text = tempCurrentPages.toString(); // update controller
                          }
                        });
                      },
                    ),
                  ),

                  // Plus Button
                  IconButton(
                    onPressed: () {
                      if (tempCurrentPages < widget.book.pages) {
                        setState(() {
                          tempCurrentPages++;
                          _pageController.text = tempCurrentPages.toString();
                        });
                      }
                    },
                    icon: const Icon(Icons.add),
                    color: Color(0xFF00476A),
                    iconSize: 20,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Page Count
                Text(
                  "$currentPages/${widget.book.pages}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00476A),
                  ),
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
                onPressed: _updateProgress,
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
                    Text("Update Progress"),
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

   void _updateProgress() {
    setState(() {
      widget.book.pageNow = tempCurrentPages;
      isUpdated = true;
      showSnackBar(context, 'Progress saved successfully.');
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      Navigator.pop(context);
    });
  }

  Future<bool> _onWillPop() async {
    if (!isCompleted && tempCurrentPages != currentPages) {
      bool? exit = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Warning!'),
          content: const Text('Unsaved changes detected. Are you sure you want to exit?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Exit',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );

      return exit ?? false;
    }
    return true;
  }

  void _deleteBookProgress() {
    setState(() {
      bookList.remove(widget.book); // Menghapus buku dari daftar
    });

    Navigator.pop(context); // Menutup halaman
    showSnackBar(context, 'Book deleted from your list.');
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class ScaffoldWithWillPop extends StatelessWidget {
  final Future<bool> Function() onWillPop;
  final Widget child;

  const ScaffoldWithWillPop({
    Key? key,
    required this.onWillPop,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: child,
    );
  }
}
