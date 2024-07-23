import 'package:animation/exemples/exemple2.dart';
import 'package:animation/exemples/exemple3_3D.dart';
import 'package:animation/exemples/exemple4.dart';
import 'package:animation/exemples/exemple5.dart';
import 'package:animation/exemples/exemple6.dart';
import 'package:animation/exemples/exemple7.dart';
import 'package:animation/shortcut/Button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SafeArea(
            child: Center(
              child: Container(
                child: Text(
                  "Choose the animation",
                  style: TextStyle(
                      color: Color(0xFFE1E1E1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          button(
              button_text: "Loading",
              funtion: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Exemple2()));
              }),
          button(
              button_text: "3D",
              funtion: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => exemple3()));
              }),
          button(
              button_text: "Hero Animation",
              funtion: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => exemple4()));
              }),
          button(
              button_text: "Photo Zoom",
              funtion: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Exemple5()));
              }),
          button(
              button_text: "Color Change",
              funtion: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => exemple6()));
              }),
          button(
              button_text: "Starting Animation",
              funtion: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => exemple7()));
              }),
        ],
      ),
    );
  }
}
