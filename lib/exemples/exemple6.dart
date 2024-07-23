import 'package:animation/shortcut/ShowDialog.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class circle_rectangle extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    final rec = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
    path.addOval(rec);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

class exemple6 extends StatefulWidget {
  const exemple6({super.key});

  @override
  State<exemple6> createState() => _exemple6State();
}

Color getRandomColor() => Color(
      0xFF000000 +
          math.Random().nextInt(
            0x00FFFFFF,
          ),
    );

class _exemple6State extends State<exemple6> {
  Color _color = getRandomColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Text("Color Change",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            IconButton(
                onPressed: () {
                  showCustomDialog(
                      context, "ColorTween", "ColorFiltered \nColorTween");
                },
                icon: Icon(Icons.info))
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ClipPath(
          clipper: circle_rectangle(),
          child: TweenAnimationBuilder(
            onEnd: () {
              setState(() {
                _color = getRandomColor();
              });
            },
            tween: ColorTween(begin: getRandomColor(), end: _color),
            duration: Duration(seconds: 1),
            builder: (context, Color? color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcATop,
                ),
                child: Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width * 1,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
