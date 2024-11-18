import 'package:flutter/material.dart';
import 'routes/appRoutes.dart';
import 'screens/default.dart';

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
      ),
      home: const DefaultScreen(title: 'Nyoba'),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

