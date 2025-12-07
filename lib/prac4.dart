import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyWidgetsDemo());
}

class MyWidgetsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputHomePage(),
    );
  }
}

void showMessage(BuildContext context, String msg) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(msg), duration: Duration(seconds: 3)));
}

class DemoPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Widget Demo"), centerTitle: true),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ------------------- TEXT -------------------
              Text(
                "Hello Bangladesh!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 5.00,
                ),
              ),
              SizedBox(height: 20),

              /// ------------------- CONTAINER -------------------
              Container(
                padding: EdgeInsets.all(16),
                height: 100.00,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromARGB(255, 91, 5, 240),
                    width: 3,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.send, color: Colors.blue, size: 30),
                      Icon(Icons.favorite, color: Colors.red, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.send, color: Colors.blue, size: 30),
                      Icon(Icons.favorite, color: Colors.red, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.send, color: Colors.blue, size: 30),
                      Icon(Icons.favorite, color: Colors.red, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.send, color: Colors.blue, size: 30),
                      Icon(Icons.favorite, color: Colors.red, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.send, color: Colors.blue, size: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              /// ------------------- INPUT (TextField) -------------------
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),

              /// ------------------- BUTTON -------------------
              ElevatedButton.icon(
                onPressed: () {
                  final name = nameController.text;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Hello $name!")));
                },
                icon: Icon(Icons.check),
                label: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shadowColor: Colors.deepOrange,
                  backgroundColor: Colors.blue,
                ),
              ),

              /// ------------------- IMAGE -------------------
              Image.network(
                "https://picsum.photos/200",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              Image.asset(
                "assets/bird2.jpg",
                height: 150,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),

              // ------------------- Asset Image -------------------
              Text(
                "Asset Image",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade300,
                ),
                child: Image.asset("assets/logo.png", fit: BoxFit.cover),
              ),

              SizedBox(height: 30),

              // ------------------- Network Image -------------------
              Text(
                "Network Image",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade300,
                ),
                child: Image.network(
                  "https://picsum.photos/400/300",
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 30),

              // ------------------- Circle Avatar -------------------
              Text(
                "Circle Avatar Image",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage("https://picsum.photos/200"),
              ),

              SizedBox(height: 30),

              // ------------------- Fade-In Network Image -------------------
              Text(
                "Fade In Network Image",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              FadeInImage.assetNetwork(
                placeholder: "assets/bird1.jpg",
                image: "https://picsum.photos/500/300",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 5000),
              ),

              // ------------------ Circle Avatar (Asset) ------------------
              Text(
                "Circle Avatar (Asset)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/logo2.png"),
              ),
              SizedBox(height: 30),

              // ------------------ Circle Avatar (Network) ------------------
              Text(
                "Circle Avatar (Network)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://picsum.photos/200"),
              ),
              SizedBox(height: 30),

              // ------------------ Rounded Rectangle (Asset) ------------------
              Text(
                "Rounded Rectangle (Asset)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/bird1.jpg",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),

              // ------------------ Rounded Rectangle (Network) ------------------
              Text(
                "Rounded Rectangle (Network)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://picsum.photos/200",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              /// ------------------- ICON -------------------
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red, size: 30),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.amber, size: 30),
                  SizedBox(width: 10),
                  Icon(Icons.send, color: Colors.blue, size: 30),
                ],
              ),
              SizedBox(height: 20),

              // ElevatedButton
              ElevatedButton(
                onPressed: () {
                  showMessage(context, "ElevatedButton Pressed");
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: Center(child: Text("ElevatedButton")),
                ),
              ),
              SizedBox(height: 20),

              // TextButton
              TextButton(
                onPressed: () => showMessage(context, "TextButton Pressed"),
                child: Text("TextButton"),
              ),
              SizedBox(height: 20),

              // OutlinedButton
              OutlinedButton(
                onPressed: () => showMessage(context, "OutlinedButton Pressed"),
                child: Text("OutlinedButton"),
              ),
              SizedBox(height: 20),

              // IconButton
              IconButton(
                icon: Icon(Icons.thumb_up, size: 30, color: Colors.blue),
                onPressed: () => showMessage(context, "IconButton Pressed"),
              ),
              SizedBox(height: 20),

              // InkWell
              InkWell(
                onTap: () => showMessage(context, "InkWell Tapped"),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "InkWell Button",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputHomePage extends StatefulWidget {
  @override
  State<InputHomePage> createState() => _InputHomePageState();
}

class _InputHomePageState extends State<InputHomePage> {
  // Controllers
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController multilineCtrl = TextEditingController();

  final List<String> genderOptions = ["Male", "Female", "Other"];

  String? selectedGender;
  bool agree = false;
  bool notificationOn = false;
  DateTime? selectedDate;

  File? pickedImage;

  Future<void> pickImage1() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> pickImageNew(ImageSource sourceParam) async {
    final picker = ImagePicker();

    try {
      final pickedFile = await picker.pickImage(source: sourceParam);

      if (pickedFile != null) {
        setState(() {
          pickedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void openImageSourceDialog() {
    showDialog(
      context: context,
      builder: (d) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(d, rootNavigator: true).pop();
                  pickImageNew(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(d, rootNavigator: true).pop();
                  pickImageNew(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showToast() {
    Fluttertoast.showToast(
      msg:
          "Name: ${nameCtrl.text}\nEmail: ${emailCtrl.text}\nPassword: ${passCtrl.text}\nNumber: ${numberCtrl.text}\nMessage: ${multilineCtrl.text}\nGender: $selectedGender\nAgree: $agree\nNotifications: $notificationOn\nDate: $selectedDate\nImage Selected: ${pickedImage != null ? 'Yes' : 'No'}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Fields Example")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // ---------------- Image Upload ----------------
          Text("Profile Image", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),

          Center(
            child: GestureDetector(
              onTap: () {
                pickImageNew(ImageSource.gallery);
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: pickedImage != null
                    ? FileImage(pickedImage!)
                    : null,
                child: pickedImage == null
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.white)
                    : null,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.photo),
                    iconSize: 40,
                    onPressed: () {
                      pickImageNew(ImageSource.gallery);
                    },
                  ),
                  Text("Gallery"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  Text("Camera"),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),

          // Image Box
          Text("Image Box", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: pickedImage == null
                ? const Center(child: Text("No Image Selected"))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(pickedImage!, fit: BoxFit.cover),
                  ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: openImageSourceDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            ),
            child: const Text(
              selectionColor: Colors.red,
              "Pick Image",
              style: TextStyle(color: Colors.black),
            ),
          ),

          SizedBox(height: 20),

          // ---------------- Name ----------------
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          // ---------------- Email ----------------
          TextField(
            controller: emailCtrl,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          // ---------------- Password ----------------
          TextField(
            controller: passCtrl,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          // ---------------- Number Input ----------------
          TextField(
            controller: numberCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Phone / Number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          // ---------------- Multiline ----------------
          TextField(
            controller: multilineCtrl,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Address / Message",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          // ---------------- Dropdown ----------------
          DropdownButtonFormField<String>(
            initialValue: selectedGender,
            decoration: InputDecoration(
              labelText: "Gender",
              border: OutlineInputBorder(),
            ),
            items: [
              "Male",
              "Female",
              "Other",
            ].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
            },
          ),
          SizedBox(height: 20),

          // ---------------- Checkbox ----------------
          Row(
            children: [
              Checkbox(
                value: agree,
                onChanged: (val) {
                  setState(() => agree = val!);
                },
              ),
              Text("I Agree to Terms & Conditions"),
            ],
          ),
          SizedBox(height: 20),

          // ---------------- Switch ----------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Enable Notifications"),
              Switch(
                value: notificationOn,
                onChanged: (val) {
                  setState(() => notificationOn = val);
                },
              ),
            ],
          ),
          SizedBox(height: 20),

          // ---------------- Date Picker ----------------
          ElevatedButton(
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) setState(() => selectedDate = picked);
            },
            child: Text(
              selectedDate == null
                  ? "Select Date"
                  : "Selected: ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
            ),
          ),
          SizedBox(height: 30),

          // ---------------- Submit Button ----------------
          ElevatedButton(onPressed: _showToast, child: Text("Show Toast")),
          SizedBox(height: 30),

          // ---------------- ListTile Example ----------------
          Divider(),
          Text(
            "ListTile Example",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text("John Doe"),
            subtitle: Text("Flutter Developer"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Fluttertoast.showToast(
                msg: "Tapped John Doe",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.green),
            title: Text("Jane Smith"),
            subtitle: Text("UI/UX Designer"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Fluttertoast.showToast(
                msg: "Tapped Jane Smith",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
          ),
        ],
      ),
    );
  }
}
