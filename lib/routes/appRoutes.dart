import 'package:flutter/material.dart';
import '../screens/bookDetails.dart';
import '../screens/formAddBook.dart';
import '../screens/profile.dart';
import '../models/bookModels.dart';
import '../screens/bookList.dart';
import '../screens/aboutUs.dart';

class AppRoutes {
  static const Home = '/bookList';
  static const BookDetail = '/booksDetail';
  static const FormAddBook = '/addBook';
  static const Profile = '/profile';
  static const About = '/aboutUs';
  


    static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ignore: pattern_never_matches_value_type
      case Home:
      final isCompleted = settings.arguments as bool;
      return MaterialPageRoute(builder: (_) => BookListPage(isCompleted: isCompleted)
      );

      case BookDetail:
      final book = settings.arguments as Book;
      return MaterialPageRoute(builder: (_) => BookDetailPage(book: book)
      );

      case Profile:
      return MaterialPageRoute(builder: (_) => ProfilePage());

      case FormAddBook:
      return MaterialPageRoute(builder: (_) => FormAddBookPage());

      case About:
      return MaterialPageRoute(builder: (_) => AboutPage());
      default:
      return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(child: Text('No Route defined'),),
      ));
    }
  }

}