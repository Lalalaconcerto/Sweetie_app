import 'package:flutter/material.dart';
import 'package:sweetie/pages/splash_page.dart';

class SweetieApp extends StatefulWidget {
  const SweetieApp({Key? key}) : super(key: key);

  @override
  State<SweetieApp> createState() => _SweetieAppState();
}

class _SweetieAppState extends State<SweetieApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}
