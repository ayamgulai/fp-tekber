import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/bookList.dart';
import 'bookDrawer.dart';

class BookTabs extends StatefulWidget {
  @override
  _BookTabsState createState() => _BookTabsState();
}

class _BookTabsState extends State<BookTabs> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      BookListPage(
        onTabSelected: (int index) {
          setState(() {
            _selectedIndex = index; // Update tab index dari tombol "Show More"
          });
        },
      ),
      BookListPage(isCompleted: false), // Currently Reading
      BookListPage(isCompleted: true),  // Completed Books
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150.0, 
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF0F4FF), // Warna latar belakang yang sama
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          alignment: Alignment.bottomLeft, 
          child: const Text(
            'Welcome, User', 
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      drawer: BookDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Currently Reading',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Completed',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
