import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/pages/ListaProjetos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskFlow',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7FCD5), // cor geral
        splashFactory: NoSplash.splashFactory, // remove splash
        highlightColor: Colors.transparent, // remove highlight
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            foregroundColor: Colors.black,
          ),
        ),
        textTheme: GoogleFonts.grandstanderTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFF7FCD5), // cor geral do app
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: listaProjetos(),
            ),
          ),
        ),
      ),
    );
  }
}
