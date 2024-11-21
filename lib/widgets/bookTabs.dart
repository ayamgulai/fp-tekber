import '../screens/bookList.dart';
import 'bookDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookTabs extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              labelColor: Color.fromARGB(255, 0, 81, 255), // Warna teks tab yang aktif
              unselectedLabelColor: Colors.grey, // Warna teks tab yang tidak aktif
              indicatorColor: Color.fromARGB(255, 0, 81, 255), // Warna garis indikato
              tabs: [
                Tab(text: 'To-Read', icon: Icon(FontAwesomeIcons.book, color: Colors.blue,),),
                Tab(text: 'Completed', icon: Icon(FontAwesomeIcons.circleCheck, color: Colors.blue)),
              ],
            ),
          ),
          drawer: BookDrawer(),
          body: TabBarView(
            children: [
              BookListPage(isCompleted: false),
              BookListPage(isCompleted: true),
            ],
          ),
        ),
      );
  }
}