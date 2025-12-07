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
   HOME PAGE (PARENT)
======================= */
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String messageFromChild = "No message yet";

  void receiveMessage(String msg) {
    setState(() {
      messageFromChild = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful Parameters")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Parent received: $messageFromChild",
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),

          CustomCounterCard(
            // ✅ required
            title: "Counter Widget",

            // ✅ optional nullable
            subtitle: "Tap + to increase",

            // ✅ optional with default
            initialCount: 2,

            // ✅ callback
            onCountChanged: receiveMessage,
          ),
        ],
      ),
    );
  }
}

/* =======================
   STATEFUL CHILD WIDGET
======================= */
class CustomCounterCard extends StatefulWidget {
  // ✅ Required
  final String title;

  // ✅ Optional nullable
  final String? subtitle;

  // ✅ Optional with default value
  final int initialCount;

  // ✅ Callback
  final void Function(String)? onCountChanged;

  const CustomCounterCard({
    super.key,
    required this.title,
    this.subtitle,
    this.initialCount = 0,
    this.onCountChanged,
  });

  @override
  State<CustomCounterCard> createState() => _CustomCounterCardState();
}

class _CustomCounterCardState extends State<CustomCounterCard> {
  late int count;

  @override
  void initState() {
    super.initState();
    // ✅ Initialize state from widget parameter
    count = widget.initialCount;
  }

  void increment() {
    setState(() {
      count++;
    });

    // ✅ Notify parent safely
    widget.onCountChanged?.call("Count changed to $count");
  }

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
            Text(widget.title, style: const TextStyle(fontSize: 20)),

            if (widget.subtitle != null)
              Text(widget.subtitle!, style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 10),
            Text("Count: $count", style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: increment,
              child: const Text("+ Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
