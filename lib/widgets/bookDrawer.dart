import 'package:flutter/material.dart';

class BookDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Color(0xFFCADBFF),
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Profile'),
        onTap: () {
          Navigator.pushNamed(context, '/profile');
        },
      )
    ],
  ),
);
  }
}