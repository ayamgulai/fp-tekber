import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/bookList.dart';
import 'bookDrawer.dart';

class BookTabs extends StatefulWidget {
  @override
  _BookTabsState createState() => _BookTabsState();
}

class _BookTabsState extends State<BookTabs> {
  int _currentIndex = 0;

  // Daftar halaman untuk setiap tab
  final List<Widget> _pages = [
    BookListPage(isCompleted: null), // Home
    BookListPage(isCompleted: false), // Currently Reading
    BookListPage(isCompleted: true), // Completed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.0, // Tinggi AppBar untuk menyesuaikan dengan gaya sebelumnya
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.blue, // Warna latar belakang yang sama
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          alignment: Alignment.bottomLeft, // Untuk menempatkan teks di kiri bawah
          child: const Text(
            'Welcome User', // Teks yang sama seperti di `BookListPage`
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      drawer: BookDrawer(), // Tetap gunakan drawer
      body: _pages[_currentIndex], // Menampilkan halaman sesuai tab aktif
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 0, 81, 255),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.book),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circleCheck),
            label: 'Currently Reading',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.star),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
