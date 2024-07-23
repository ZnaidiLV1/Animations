import 'package:flutter/material.dart';

class button extends StatefulWidget {
  String button_text;
  VoidCallback funtion;
  button({super.key, required this.button_text, required this.funtion});

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xFF309383)),
      child: MaterialButton(
        onPressed: widget.funtion,
        child: Text(
          widget.button_text,
          style: TextStyle(color: Color(0xFFE1E1E1)),
        ),
      ),
    );
  }
}
