import 'package:animation/exemples/exemple4Detail.dart';
import 'package:flutter/material.dart';

class Personne {
  final String emoji;
  final String name;
  final int age;

  Personne({required this.emoji, required this.name, required this.age});
}

List<Personne> personne = [
  Personne(emoji: '🙋‍♂️', name: "znaidi", age: 22),
  Personne(emoji: '🤦‍♂️', name: "oussema", age: 23),
  Personne(emoji: '😊', name: "wissem", age: 22),
];

class exemple4 extends StatefulWidget {
  const exemple4({super.key});

  @override
  State<exemple4> createState() => _exemple4State();
}

class _exemple4State extends State<exemple4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        title: Text("People",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: personne.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PersonDetail(person: personne[index])));
              },
              title: Hero(
                  tag: personne[index].name, child: Text(personne[index].name)),
              subtitle: Text(personne[index].age.toString()),
              leading: Text(
                personne[index].emoji,
                style: TextStyle(fontSize: 40),
              ),
            );
          }),
    );
  }
}
