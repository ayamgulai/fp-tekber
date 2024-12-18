import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fp_tekber/firebase_options.dart';
import 'routes/appRoutes.dart';
import 'widgets/bookTabs.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
