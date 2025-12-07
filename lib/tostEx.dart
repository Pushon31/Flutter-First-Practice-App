import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MessageDemoApp());
}

class MessageDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessageHomePage(),
    );
  }
}

class MessageHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Toasts, SnackBars & Modals")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // ---------------- SnackBar ----------------
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("This is a SnackBar!"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text("Show SnackBar"),
            ),
            SizedBox(height: 20),

            // ---------------- Toast ----------------
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "This is a Toast!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.black87,
                  textColor: Colors.white,
                  fontSize: 16,
                );
              },
              child: Text("Show Toast"),
            ),
            SizedBox(height: 20),

            // ---------------- AlertDialog ----------------
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("AlertDialog"),
                    content: Text("This is a modal alert dialog."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Show AlertDialog"),
            ),
            SizedBox(height: 20),

            // ---------------- SimpleDialog ----------------
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => SimpleDialog(
                    title: Text("Choose Option"),
                    children: [
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, "Option 1"),
                        child: Text("Option 1"),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, "Option 2"),
                        child: Text("Option 2"),
                      ),
                    ],
                  ),
                ).then((value) {
                  if (value != null) {
                    Fluttertoast.showToast(msg: "Selected: $value");
                  }
                });
              },
              child: Text("Show SimpleDialog"),
            ),
            SizedBox(height: 20),

            // ---------------- BottomSheet ----------------
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (_) => Container(
                    padding: EdgeInsets.all(20),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bottom Sheet",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("This is a modal bottom sheet example."),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Close"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text("Show BottomSheet"),
            ),
            SizedBox(height: 20),

            // ---------------- Custom Dialog ----------------
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 180,
                      child: Column(
                        children: [
                          Text(
                            "Custom Dialog",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("You can fully customize this modal dialog."),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Close"),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text("Show Custom Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
