import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: InputHomePage());
  }
}

class DemoPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo page"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This is a Text demo...",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // ---- TextField ----
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              // ---- Button ----
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),

              SizedBox(height: 20),

              // ---- Network Image ----
              Image.network(
                "https://www.paperandtea.com/cdn/shop/articles/Erdbeere_7f8c4953-41d4-4400-b0c6-718d5b4436d2.jpg?v=1762339145&width=1024",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 20),

              // ---- Asset Image ----
              Image.asset(
                "asset/gun.jpg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=",
                ),
              ),
              SizedBox(height: 10),
              FadeInImage.assetNetwork(
                placeholder: "asset/gun.jpg",
                image:
                    "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=",
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 5000),
              ),
              SizedBox(height: 10),
              FadeInImage.assetNetwork(
                placeholder: "asset/gun.jpg",
                image:
                    "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=",
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 5000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputHomePage extends StatefulWidget {
  const InputHomePage({super.key});

  @override
  State<InputHomePage> createState() => _InputHomePageState();
}

class _InputHomePageState extends State<InputHomePage> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController multilineCtrl = TextEditingController();

  String? selectedGender;
  bool agree = false;
  bool notificationOn = false;
  DateTime? selectedDate;

  File? pickedImage;

  Future<void> pickImage1() async{
    final picker = ImagePicker();
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(PickedFile != null){
      setState(() {
        pickedImage = File(PickedFile.path);
      });
    }
  }
  Future<void> pickImage2(ImageSource sourceParam) async{
    final picker = ImagePicker();
    try {
      final PickedFile = await picker.pickImage(source: sourceParam);
      if(PickedFile!=null){
        setState(() {
          pickedImage = File(PickedFile.path);
        });
      }
    }catch(e){
      print("Error Picking image : $e");
    }
  }

  void openImageSourceDialog(){
    showDialog(
      context: context,
      builder: (dialogCtx){
        return AlertDialog(
          title: const Text("Select image source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: (){
                  Navigator.of(dialogCtx,rootNavigator: true).pop();
                  pickImage2(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: (){
                  Navigator.of(dialogCtx,rootNavigator: true).pop();
                  pickImage2(ImageSource.camera);
                },
              ),

            ],
          ),
        );
      }
    );
  }

  void _showToast() {
    Fluttertoast.showToast(
      msg:
          "Name : ${nameCtrl.text}\nEmail : ${emailCtrl.text}\nPassword : ${passCtrl.text}\nNumber : ${numberCtrl.text}\nMultiline : ${multilineCtrl.text}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input fields Example")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          //.......Image Upload........
          Text("Profile Image",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Center(
            child: GestureDetector(
              onTap: pickImage1,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                backgroundImage: pickedImage != null ? FileImage(pickedImage!)
                :null,
                child: pickedImage == null
                ?Icon(Icons.camera_alt,size: 50,color: Colors.white)
                :null,
              ),
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                  IconButton(
                    icon: Icon(Icons.browse_gallery),
                    iconSize: 40,
                    onPressed: (){
                      pickImage2(ImageSource.gallery);
                    },
                    
                  ),Text("Gallery"),
                 ],
              ),
              Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                  IconButton(
                    icon: Icon(Icons.camera),
                    iconSize: 40,
                    onPressed: (){
                      pickImage2(ImageSource.camera);
                    },
                    
                  ),Text("Camera"),
                 ],
              )
            ],
          ),

          ElevatedButton(
            onPressed: openImageSourceDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 14),

            ),
            child: const Text("Pick Image"),
          ),

          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: 'Address/Message',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),


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
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
