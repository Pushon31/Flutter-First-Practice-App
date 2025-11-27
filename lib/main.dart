import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(primarySwatch: Colors.blue),
      home: Youtube(),
    );
  }
}

class Practice1 extends StatelessWidget{
  const Practice1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
        titleSpacing: 50,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 10,
        backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(onPressed: (){
            Fluttertoast.showToast(msg:"Hello Brother",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black,
            textColor: Colors.white);
            
           
          }, icon: Icon(Icons.accessible
          )),
          SizedBox(width: 10),
           IconButton(onPressed: (){
            Fluttertoast.showToast(msg:"This is home button",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black,
            textColor: Colors.white);
            
           
          }, icon: Icon(Icons.home
          )),
          SizedBox(width: 16),
          


        ],
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: 200.00,
          color: const Color.fromARGB(255, 97, 180, 248),
          child: Center(
            child: Text(
              "Feeling",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
         UserAccountsDrawerHeader(
          accountName: Text("Gun Shot"), 
          accountEmail: Text("gun@ex.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child:ClipOval(
              child:  Image.asset('asset/gun.jpg',
              width : 80.0,
              height : 80.0,
              fit: BoxFit.cover,),
              
              
            )),
            
          ),
            ListTile(
              leading: Icon(Icons.home),
              subtitle: Text("Go Home"),
              title: Text("Home"),
              trailing: Icon(Icons.ac_unit_rounded),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, 
            icon: Icon(Icons.account_balance),
            ),
            IconButton(onPressed: (){}, 
            icon: Icon(Icons.facebook),
            ),
            IconButton(onPressed: (){}, 
            icon: Icon(Icons.car_crash),
            ),
            IconButton(onPressed: (){}, 
            icon: Icon(Icons.air),
            ),
           
          ],
        ),
      ),
    );
  }
}

// class MyAppBar extends  {
// }
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePage(),
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (index){
          print(index);
        },

        items: const [
          BottomNavigationBarItem(
            icon:   Icon(Icons.home_filled), 
            label: "Home"),
          BottomNavigationBarItem(
            icon:   Icon(Icons.video_collection), 
            label: "Shorts"),
          BottomNavigationBarItem(
            icon:   Icon(Icons.add_circle_outline),
            label: "Add"),
          BottomNavigationBarItem(
            icon:   Icon(Icons.subscriptions), 
            label: "Subscriptions"), 
          BottomNavigationBarItem(
            icon:   Icon(Icons.library_books),
            label: "Library"),
          
        ],
      ),
    );
  }
}

