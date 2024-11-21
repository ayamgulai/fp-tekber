import '../screens/bookList.dart';
import 'bookDrawer.dart';
import 'package:flutter/material.dart';

class BookTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            labelColor: Color(0xFF3D6CD3),
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: 'To-Read',
                icon: Icon(Icons.list),
              ),
              Tab(
                text: 'Completed',
                icon: Icon(Icons.check_box),
              ),
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
