import 'package:animation/exemples/exemple3_3D.dart';
import 'package:animation/exemples/exemple4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Flutter Demo',
      home: exemple4(),
    );
  }
}