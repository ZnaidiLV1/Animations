import 'dart:math';

import 'package:animation/exemples/test.dart';
import 'package:animation/shortcut/ShowDialog.dart';
import 'package:flutter/material.dart';

class Exemple2 extends StatefulWidget {
  const Exemple2({super.key});

  @override
  State<Exemple2> createState() => _Exemple2State();
}

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close();
    return path;
  }
}

class HalfCircle extends CustomClipper<Path> {
  final CircleSide side;

  HalfCircle({required this.side});
  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _Exemple2State extends State<Exemple2> with TickerProviderStateMixin {
  late AnimationController _controllerRotationZCounterClock;
  late Animation _animationRotationZCounterClock;

  late AnimationController _controllerFlipZCounterClock;
  late Animation _animationFlipZCounterClock;

  @override
  void initState() {
    super.initState();
    // Z rotation
    _controllerRotationZCounterClock =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationRotationZCounterClock = Tween<double>(begin: 0, end: -(pi / 2))
        .animate(CurvedAnimation(
            parent: _controllerRotationZCounterClock, curve: Curves.bounceOut));
    //y rotation flip
    _controllerFlipZCounterClock =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationFlipZCounterClock = Tween<double>(
            begin: _animationRotationZCounterClock.value + pi,
            end: _animationRotationZCounterClock.value + pi)
        .animate(CurvedAnimation(
            parent: _controllerFlipZCounterClock, curve: Curves.bounceOut));
    // listeners
    _controllerRotationZCounterClock.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationFlipZCounterClock = Tween<double>(
                begin: _animationFlipZCounterClock.value,
                end: _animationFlipZCounterClock.value + pi)
            .animate(CurvedAnimation(
                parent: _controllerFlipZCounterClock, curve: Curves.bounceOut));
        _controllerFlipZCounterClock
          ..reset()
          ..forward();
      }
    });
    _controllerFlipZCounterClock.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationRotationZCounterClock = Tween<double>(
                begin: _animationRotationZCounterClock.value,
                end: _animationRotationZCounterClock.value + -(pi / 2))
            .animate(CurvedAnimation(
                parent: _controllerRotationZCounterClock,
                curve: Curves.bounceOut));
        _controllerRotationZCounterClock
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    _controllerFlipZCounterClock.dispose();
    _controllerRotationZCounterClock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      _controllerRotationZCounterClock
        ..reset()
        ..forward();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 60),
              child: Text("Starting",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            IconButton(
                onPressed: () {
                  showCustomDialog(context, "ClipPath", "CustomClipper<Path>");
                },
                icon: Icon(Icons.info))
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge(
              [_controllerRotationZCounterClock, _controllerFlipZCounterClock]),
          builder: (BuildContext context, Widget? child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_animationRotationZCounterClock.value)
                ..rotateY(_animationFlipZCounterClock.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: HalfCircle(side: CircleSide.left),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Color(0xff0057b7),
                    ),
                  ),
                  ClipPath(
                    clipper: HalfCircle(side: CircleSide.right),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Color(0xffffd700),
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
