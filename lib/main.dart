import 'dart:math';

import 'package:animation/exemples/exemple3_3D.dart';
import 'package:animation/exemples/exemple4.dart';
import 'package:animation/exemples/exemple5.dart';
import 'package:animation/exemples/exemple6.dart';
import 'package:animation/exemples/exemple7.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Flutter Demo',
      home: exemple7(),
    );
  }
}
