
import 'package:ay_app/paramEx3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyRoutingApp());
}

class MyRoutingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Routing Demo",
      // initialRoute: '/about',

      // Named routes
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

// ---------------- Home Page ----------------
class HomePage extends StatelessWidget {

  void handleMessage(String msg) {
    debugPrint("Callback received: $msg");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Named Route (pushNamed)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text("Go to About Page"),
            ),

            SizedBox(height: 20),

            // 2. Route with push()
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Text("Go to Profile Page"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomCard(
                      title: "Hello Saiful",
                      subtitle: "Software Engineer",
                      count: 5,
                      onTapMessage: handleMessage,
                    ),
                  ),
                );
              },
              child: Text("Go to CustomCard Page"),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- About Page ----------------
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Back to previous page
          },
          child: Text("Go Back"),
        ),
      ),
    );
  }
}

// ---------------- Profile Page ----------------
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Back to Home
          },
          child: Text("Back to Home"),
        ),
      ),
    );
  }
}
