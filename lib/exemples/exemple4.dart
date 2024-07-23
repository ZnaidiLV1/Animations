import 'package:animation/exemples/exemple4Detail.dart';
import 'package:animation/shortcut/ShowDialog.dart';
import 'package:flutter/material.dart';

class Personne {
  final String emoji;
  final String name;
  final int age;

  Personne({required this.emoji, required this.name, required this.age});
}

List<Personne> personne = [
  Personne(emoji: '🙋‍♂️', name: "Person1", age: 22),
  Personne(emoji: '🤦‍♂️', name: "Person2", age: 23),
  Personne(emoji: '😊', name: "Person3", age: 22),
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 103),
              child: Text("Hero",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            IconButton(
                onPressed: () {
                  showCustomDialog(context, "Tag", "flightShuttleBuilder");
                },
                icon: Icon(Icons.info))
          ],
        ),
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
