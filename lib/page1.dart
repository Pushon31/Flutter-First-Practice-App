import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

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
      body: ListView(
        children: [
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("List Tile 1"),
            subtitle: Text("ListTile practice with saiful.."),
            leading: CircleAvatar(
              child: Icon(Icons.add_call),
            ),
            trailing: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
