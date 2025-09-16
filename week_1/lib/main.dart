import 'package:flutter/material.dart';

import 'screens/ahwa_manager_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Ahwa Manager',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[700],
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown[600],
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const AhwaManagerScreen(),
    );
  }
}
