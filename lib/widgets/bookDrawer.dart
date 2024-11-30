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
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book Tabs',
                  style: TextStyle(
                    color: Colors.white,
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
              // Handle Home tap
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Library'),
            onTap: () {
              // Handle Library tap
            },
          ),
          // Add more list tiles as needed
        ],
      ),
    );
  }
}
