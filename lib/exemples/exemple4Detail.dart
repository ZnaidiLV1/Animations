import 'package:animation/exemples/exemple4.dart';
import 'package:flutter/material.dart';

class PersonDetail extends StatefulWidget {
  final Personne person;
  const PersonDetail({super.key, required this.person});

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        title: Hero(
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                      scale: animation.drive(Tween(begin: 0.0, end: 1.0)
                          .chain(CurveTween(curve: Curves.fastOutSlowIn))),
                      child: toHeroContext.widget),
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: fromHeroContext.widget,
                );
            }
          },
          tag: widget.person.name,
          child: Material(
            color: Colors.transparent,
            child: Text(widget.person.emoji,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text(
              widget.person.name,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            child: Text(widget.person.age.toString(),
                style: TextStyle(fontSize: 25)),
          ),
        ],
      ),
    );
  }
}
