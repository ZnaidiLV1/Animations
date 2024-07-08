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
  Personne(emoji: '😊', name: "happy", age: 22),
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
        title: Text("People"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: personne.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(personne[index].name),
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
