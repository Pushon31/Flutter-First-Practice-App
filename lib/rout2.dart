import 'package:flutter/material.dart';

void main() {
  runApp(AllRoutingApp());
}

class AllRoutingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "All Routing Types Demo",

      // 2. Named Routes
      routes: {
        '/': (_) => HomePage(),
        '/named': (_) => NamedRoutePage(),
      },

      // 3. Dynamic Routing (onGenerateRoute)
      onGenerateRoute: (settings) {
        if (settings.name == '/dynamic') {
          final msg = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (_) => DynamicRoutePage(message: msg ?? "No Message"),
          );
        }
        return null;
      },
    );
  }
}

// ---------------------------------------------------------------
// 1. HOME PAGE — Demonstrates all routing types
// ---------------------------------------------------------------
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Routing Types")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            
            btn(context, "1. Basic Routing (push)", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BasicRoutePage()),
              );
            }),

            btn(context, "2. Named Route (pushNamed)", () {
              Navigator.pushNamed(context, '/named');
            }),

            btn(context, "3. Dynamic Route (arguments)", () {
              Navigator.pushNamed(
                context,
                '/dynamic',
                arguments: "Hello Saiful from Home!",
              );
            }),

            btn(context, "4. Push Replacement", () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => ReplacementPage()),
              );
            }),

            btn(context, "5. Push & Remove Until", () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => FinalPage()),
                (route) => false,
              );
            }),

            btn(context, "6. Pass + Return Data", () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SendDataPage()),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Returned: $result")),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget btn(BuildContext c, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

// ---------------------------------------------------------------
// 1. BASIC ROUTING
// ---------------------------------------------------------------
class BasicRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Routing")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Back"),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
// 2. NAMED ROUTE
// ---------------------------------------------------------------
class NamedRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Named Route Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Back"),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
// 3. DYNAMIC ROUTE (with arguments)
// ---------------------------------------------------------------
class DynamicRoutePage extends StatelessWidget {
  final String message;
  DynamicRoutePage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dynamic Route")),
      body: Center(
        child: Text(message, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

// ---------------------------------------------------------------
// 4. PUSH REPLACEMENT
// ---------------------------------------------------------------
class ReplacementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Replaced Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
          ),
          child: Text("Go Back to Home (Replacement)"),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
// 5. PUSH & REMOVE UNTIL
// ---------------------------------------------------------------
class FinalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Final Page (No Back Stack)")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
              (route) => false,
            );
          },
          child: Text("Restart App"),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
// 6. PASS DATA AND RETURN RESULT
// ---------------------------------------------------------------
class SendDataPage extends StatelessWidget {
  final ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pass & Return Data")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ctrl,
              decoration: InputDecoration(
                labelText: "Enter something...",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, ctrl.text);
              },
              child: Text("Return Data"),
            ),
          ],
        ),
      ),
    );
  }
}
