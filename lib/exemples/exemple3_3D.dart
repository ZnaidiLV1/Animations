// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:animation/shortcut/ShowDialog.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class exemple3 extends StatefulWidget {
  const exemple3({super.key});

  @override
  State<exemple3> createState() => _exemple3State();
}

class _exemple3State extends State<exemple3> with TickerProviderStateMixin {
  late AnimationController _ycontroller;
  late AnimationController _xcontroller;
  late AnimationController _zcontroller;
  late Tween<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _xcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _ycontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 30));
    _zcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 40));
    _animation = Tween<double>(begin: 0, end: pi * 2);
  }

  @override
  void dispose() {
    _xcontroller.dispose();
    _ycontroller.dispose();
    _zcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xcontroller
      ..reset()
      ..repeat();
    _ycontroller
      ..reset()
      ..repeat();
    _zcontroller
      ..reset()
      ..repeat();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 118),
              child: Text("3D",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            IconButton(
                onPressed: () {
                  showCustomDialog(
                      context, "Listenable.merge", "..translate vmath.Vector3");
                },
                icon: Icon(Icons.info))
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation:
              Listenable.merge([_xcontroller, _ycontroller, _zcontroller]),
          builder: (BuildContext context, Widget? child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateX(_animation.evaluate(_xcontroller))
                ..rotateY(_animation.evaluate(_ycontroller))
                ..rotateZ(_animation.evaluate(_zcontroller)),
              child: Stack(
                children: [
                  // back
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(vmath.Vector3(0, 0, -100)),
                    child: Container(
                      color: Colors.purple,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  //front
                  Container(
                    color: Colors.black,
                    width: 100,
                    height: 100,
                  ),
                  //left side
                  Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()..rotateY(pi / 2),
                    child: Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  //right side
                  Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()..rotateY(-pi / 2),
                    child: Container(
                      color: const Color.fromARGB(255, 54, 187, 244),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  //top side
                  Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()..rotateX(-pi / 2),
                    child: Container(
                      color: Colors.grey,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  //bottom side
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()..rotateX(pi / 2),
                    child: Container(
                      color: Color.fromARGB(255, 220, 242, 23),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
