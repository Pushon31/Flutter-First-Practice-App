import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Container(
              color: Colors.amberAccent,
              height: 250,
              width: 250,
              child: TextButton(onPressed: (){

                Navigator.pushNamedAndRemoveUntil(context, "/p1", (route) => false);

              }, child: Text("Routing--1")),
            ),
            Container(
              color: Colors.cyan,
              height: 250,
              width: 250,
              child: TextButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, "/p2", (route) => false);

              }, child: Text("Routing--2")),

            ),
            Container(
              color: Colors.teal,
              height: 250,
              width: 250,
              child: TextButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, "/p3", (route) => false);

              }, child: Text("Routing--3")),

            ),
            Container(
              color: Colors.amberAccent,
              height: 250,
              width: 250,
              child: ElevatedButton(onPressed: (){}, child: Text("Routing--4")),

            ),
          ],
        ),
      ),
    );
  }
}
