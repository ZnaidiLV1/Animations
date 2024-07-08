import 'package:animation/exemples/exemple4.dart';
import 'package:flutter/material.dart';

class PersonDetail extends StatefulWidget {
  final Personne person;
  const PersonDetail({super.key, required
  this.person});

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        title: Text("People"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Text(widget.person.name),
          ),
          Container(
            child: Text(widget.person.age.toString()),
          ),
        ],
      ),
    );
  }
}
