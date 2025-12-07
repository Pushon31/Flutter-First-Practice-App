import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    this.color = Colors.blue, // default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget with Parameter")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InfoCard(title: "Name", value: "Saiful", color: Colors.green),
            InfoCard(
              title: "Role",
              value: "Software Engineer",
              color: Colors.orange,
            ),
            InfoCard(title: "Country", value: "Bangladesh"),
          ],
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String text;
  final IconData? icon;

  const LabelText({
    Key? key,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) Icon(icon),
        if (icon != null) SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}


//✅ 3️⃣ Widget with Callback Parameter (VERY important)
class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ActionButton({Key? key, required this.text, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

void main(List<String> args) {
  ActionButton(
    text: "Click Me",
    onPressed: () {
      print("Button Clicked!");
    },
  );
}



///STF
///
///


