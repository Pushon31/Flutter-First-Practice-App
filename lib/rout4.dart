import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// -------------------------------
// MyApp (StatelessWidget)
// -------------------------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Routing Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/dynamic') {
          final args = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (_) => DynamicPage(message: args ?? 'No message'),
          );
        }
        return null; // Let other routes handle
      },
    );
  }
}


// -------------------------------
// HomePage (StatelessWidget)
// -------------------------------
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page (Stateless)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text("Go to About (Stateful)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: Text("Go to Contact (Stateful)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/dynamic',
                  arguments: "Hello from Home!",
                );
              },
              child: Text("Go to Dynamic Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/about');
              },
              child: Text("Go to About (Replace Current)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => AboutPage()),
                  (route) => false,
                );
              },
              child: Text("Go to About (Clear Stack)"),
            ),
            SizedBox(height: 20),
            Text("Navigate using BottomNavigation Example below"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BottomNavExample()),
                );
              },
              child: Text("Go to Bottom Navigation Demo"),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------
// AboutPage (StatefulWidget)
// -------------------------------
class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int counter = 0;

  void increment() {
    setState(() => counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Page (Stateful)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: $counter", style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: increment,
              child: Text("Increment Counter"),
            ),
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

// -------------------------------
// ContactPage (StatefulWidget)
// -------------------------------
class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Page (Stateful)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contact Page Example", style: TextStyle(fontSize: 22)),
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

// -------------------------------
// DynamicPage (StatefulWidget with arguments)
// -------------------------------
class DynamicPage extends StatefulWidget {
  final String message;

  DynamicPage({required this.message});

  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dynamic Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Message: ${widget.message}", style: TextStyle(fontSize: 22)),
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

// -------------------------------
// Bottom Navigation Example (StatefulWidget)
// -------------------------------
class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _currentIndex = 0;

  final pages = [HomePage(), AboutPage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation Example")),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: "Contact",
          ),
        ],
      ),
    );
  }
}
