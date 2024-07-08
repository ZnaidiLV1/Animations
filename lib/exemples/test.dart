import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class halfCircle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    late Offset offset;
    bool isClockWise = false;
    path.moveTo(size.width, 0);
    path.arcToPoint(
      offset = Offset(size.width, size.height),
      clockwise: isClockWise,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: halfCircle(),
          child: Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
