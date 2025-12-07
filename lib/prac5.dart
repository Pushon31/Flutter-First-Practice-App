import 'package:flutter/material.dart';

void main() {
  runApp(AllWidgetsDemo());
}

class AllWidgetsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Welcome Saiful!",
                  style: TextStyle(fontSize: 22, color: Colors.white)),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(title: Text("Home")),
            ListTile(title: Text("Profile")),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text("All Widgets in One File"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---------------- TEXT ----------------
            Text(
              "Hello Saiful!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),


            // ---------------- CONTAINER ----------------
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Text("This is a Container widget."),
            ),
            SizedBox(height: 20),


            // ---------------- INPUT ----------------
            TextField(
              controller: inputController,
              decoration: InputDecoration(
                labelText: "Enter something...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            SizedBox(height: 20),


            // ---------------- IMAGE ----------------
            Image.network(
              "https://picsum.photos/200",
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),


            // ---------------- ICONS ----------------
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 30),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.amber, size: 30),
                SizedBox(width: 10),
                Icon(Icons.home, color: Colors.blue, size: 30),
              ],
            ),
            SizedBox(height: 20),


            // ---------------- BUTTON ----------------
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Hello ${inputController.text}!")),
                );
              },
              icon: Icon(Icons.send),
              label: Text("Submit"),
            ),
            SizedBox(height: 20),


            // ---------------- ROW ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Row Item 1"),
                Text("Row Item 2"),
                Text("Row Item 3"),
              ],
            ),
            SizedBox(height: 20),


            // ---------------- COLUMN ----------------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Column Line 1"),
                Text("Column Line 2"),
              ],
            ),
            SizedBox(height: 20),


            // ---------------- LISTVIEW (inside column) ----------------
            Container(
              height: 150,
              child: ListView(
                children: [
                  ListTile(title: Text("List Item 1")),
                  ListTile(title: Text("List Item 2")),
                  ListTile(title: Text("List Item 3")),
                ],
              ),
            ),
            SizedBox(height: 20),


            // ---------------- CARD ----------------
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Saiful"),
                subtitle: Text("Senior Developer"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            SizedBox(height: 20),


            // ---------------- STACK ----------------
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    "Stack Positioned",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),


            // ---------------- GESTURE DETECTOR ----------------
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Tapped!"),
                    content: Text("You tapped the orange box."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.orange,
                child: Text("Tap Me"),
              ),
            ),
            SizedBox(height: 20),


            // ---------------- CIRCLE AVATAR ----------------
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage:
                    NetworkImage("https://picsum.photos/100"),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
