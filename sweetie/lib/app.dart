import 'package:flutter/material.dart';
import 'package:sweetie/model/product.dart';
import 'package:sweetie/pages/home_page.dart';
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
      // TODO: Add a theme (103)
    );
  }
}

// TODO: Build a Sweetie Theme (103)
// TODO: Build a Sweetie Text Theme (103)
