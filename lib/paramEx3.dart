import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* =======================
   ROOT APP
======================= */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/* =======================
   HOME PAGE
======================= */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void handleMessage(String msg) {
    debugPrint("Callback received: $msg");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parameter Types")),
      body: Center(
        child: CustomCard(
          // ✅ required
          title: "Hello Saiful",

          // ✅ optional (nullable)
          subtitle: "Software Engineer",

          // ✅ optional with default
          count: 5,

          // ✅ callback
          onTapMessage: handleMessage,
        ),
      ),
    );
  }
}

/* =======================
   CUSTOM STATELESS WIDGET
======================= */
class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int count;
  final Function(String)? onTapMessage;

  const CustomCard({
    super.key,
    required this.title,
    this.subtitle,
    this.count = 0,
    this.onTapMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 22)),

            if (subtitle != null)
              Text(subtitle!, style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 10),
            Text("Count: $count"),

            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // ✅ Safe callback call
                if (onTapMessage != null) {
                  onTapMessage!("Button tapped");
                } else {
                  Navigator.pop(context); // Back to Home
                }
              },
              child: onTapMessage != null
                  ? const Text("Send Callback")
                  : const Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
