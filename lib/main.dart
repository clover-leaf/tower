import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/view/app.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.jomhuriaTextTheme(),
      ),
      home: const App(),
    );
  }
}
