import 'package:flutter/material.dart';

class BookDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4FF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book Tabs',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/bookList');
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          // Add more list tiles as needed
        ],
      ),
    );
  }
}
