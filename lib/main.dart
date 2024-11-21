import 'package:flutter/material.dart';
import 'routes/appRoutes.dart';
import 'widgets/bookTabs.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FP Tekber',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.beVietnamProTextTheme(),
      ),
      home: BookTabs(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

