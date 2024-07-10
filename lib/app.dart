import 'package:flutter/material.dart';
import 'package:sample/home.dart';
import 'package:sample/screen1.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      // home: HomeScreen(),
      home: ScreenOne(),
    );
  }
}