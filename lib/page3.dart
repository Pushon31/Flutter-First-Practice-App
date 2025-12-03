import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, "/p1", (route) => false);
              },
              icon: Icon(Icons.account_balance)),
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, "/p2", (route) => false);
              },
              icon: Icon(Icons.accessibility)),
          IconButton(onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, "/p3", (route) => false);

          }, icon: Icon(Icons.accessible_forward))
        ],
      ),
      body: ListView(children: [
        Container(
          color: Colors.amberAccent,
          height: 250,
          width: 250,
          child: TextButton(onPressed: (){}, child: Text("Routing--1")),
        ),
        Container(
          color: Colors.cyan,
          height: 250,
          width: 250,
          child: TextButton(onPressed: (){}, child: Text("Routing--2")),

        ),
        Container(
          color: Colors.teal,
          height: 250,
          width: 250,
          child: TextButton(onPressed: (){}, child: Text("Routing--3")),

        ),
        Container(
          color: Colors.amberAccent,
          height: 250,
          width: 250,
          child: TextButton(onPressed: (){}, child: Text("Routing--4")),

        ),
        Container(
          color: Colors.teal,
          height: 250,
          width: 250,
        ),
        Container(
          color: Colors.amberAccent,
          height: 250,
          width: 250,
        ),
        Container(
          color: Colors.cyan,
          height: 250,
          width: 250,
        ),
        Container(
          color: Colors.teal,
          height: 250,
          width: 250,
        ),
      ]),
    );
  }
}
