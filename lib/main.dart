import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const AbuAlEzzApp());
}

class AbuAlEzzApp extends StatelessWidget {
  const AbuAlEzzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abu Al-Ezz Business Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
