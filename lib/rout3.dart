import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ---------------------------
// MyApp (StatelessWidget)
// ---------------------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Routing Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),        // Stateless
        '/about': (context) => AboutPage(),  // Stateful
        '/contact': (context) => ContactPage(), // Stateful with arguments
      },
    );
  }
}

// ---------------------------
// HomePage (StatelessWidget)
// ---------------------------
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text("Go to About Page"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/contact',
                  arguments: "Hello from Home Page!",
                );
              },
              child: Text("Go to Contact Page with Data"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Replace current page (no back button)
                Navigator.pushReplacementNamed(context, '/about');
              },
              child: Text("Go to About Page (Replace)"),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------
// AboutPage (StatefulWidget)
// ---------------------------
class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Page (Stateful)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: $counter",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: increment,
              child: Text("Increment Counter"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------
// ContactPage (StatefulWidget with arguments)
// ---------------------------
class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String receivedMessage = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args != null && args is String) {
      receivedMessage = args;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Page (Stateful)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              receivedMessage.isNotEmpty
                  ? "Received: $receivedMessage"
                  : "No data received",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
