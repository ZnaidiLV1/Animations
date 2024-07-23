import 'package:animation/shortcut/ShowDialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const Exemple5(),
    );
  }
}

class Exemple5 extends StatefulWidget {
  const Exemple5({Key? key}) : super(key: key);

  @override
  State<Exemple5> createState() => _Exemple5State();
}

const defaultWidth = 100.0;

class _Exemple5State extends State<Exemple5> {
  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 90),
              child: Text("Photo",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            IconButton(
                onPressed: () {
                  showCustomDialog(context, "AnimatedContainer", "");
                },
                icon: Icon(Icons.info))
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!_isZoomedIn) ...{
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isZoomedIn = !_isZoomedIn;
                      _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                      _width = _isZoomedIn
                          ? MediaQuery.of(context).size.width
                          : defaultWidth;
                      _curve =
                          _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 370,
                    ),
                    width: _width,
                    curve: _curve,
                    child: Image.asset(
                      'images/wallpaper.jpg',
                    ),
                  ),
                ),
              ],
            ),
            Center(child: Text("Tap on photo to zoom in")),
          } else ...{
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isZoomedIn = !_isZoomedIn;
                      _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                      _width = _isZoomedIn
                          ? MediaQuery.of(context).size.width
                          : defaultWidth;
                      _curve =
                          _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 370,
                    ),
                    width: _width,
                    curve: _curve,
                    child: Image.asset(
                      'images/wallpaper.jpg',
                    ),
                  ),
                ),
              ],
            ),
          }
        ],
      ),
    );
  }
}
