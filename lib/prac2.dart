// import 'package:flutter/material.dart';


// class pracN12 extends StatelessWidget {
//   const pracN12({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("My App"),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 // print("aaaa");
//               },
//               icon: Icon(Icons.account_balance),
//             ),
//             IconButton(
//               onPressed: () {
//                 // MySnackBar("2nd Button", context);
//                 // print("accessibility");
//               },
//               icon: Icon(Icons.accessibility),
//             ),
//             IconButton(onPressed: () {}, icon: Icon(Icons.accessible_forward)),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.account_balance_wallet),
//             ),
//             IconButton(onPressed: () {}, icon: Icon(Icons.add_to_drive)),
//           ],
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Tab 1', icon: Icon(Icons.yard)),
//               Tab(text: 'Tab 3', icon: Icon(Icons.adb_rounded)),
//               Tab(text: 'Tab 3', icon: Icon(Icons.account_circle_outlined)),
//               Tab(text: 'Tab 4', icon: Icon(Icons.account_circle_outlined)),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [Page1(), Page2(), Page3(), Page3()]),
//       ),
//     );
//   }
// }

// //BottomNavigationBar  With State full
// class PracN12 extends StatefulWidget {
//   const PracN12({super.key});

//   @override
//   State<PracN12> createState() => _nameState();
// }

// class _nameState extends State<PracN12> {
//   var _currentState = 0;
//   final pages = [Page1(), Page2(), Page3()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentState,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromARGB(87, 204, 175, 44),
//             label: "Message",
//             icon: Icon(Icons.account_box_outlined),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromARGB(87, 204, 175, 44),
//             label: "Call",
//             icon: Icon(Icons.call),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromARGB(87, 204, 175, 44),
//             label: "Pan Tool",
//             icon: Icon(Icons.pan_tool),
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentState = index;
//           });
//         },
//       ),
//       body: pages[_currentState],
//     );
//   }
// }

// // Hero Icon
// class PracticeN11 extends StatelessWidget {
//   const PracticeN11({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircleAvatar(
//           radius: 50,
//           child: GestureDetector(
//             child: Hero(tag: "Add", child: Icon(Icons.work_off)),
//             onTap: () {},
//           ),
//         ),
//       ),
//     );
//   }
// }

// ///First stf weget you need to call it from main method

// // void main() {
// // runApp(MyFirstStateFullW());
// // }

// class MyFirstStateFullW extends StatefulWidget {
//   const MyFirstStateFullW({super.key});

//   @override
//   State<MyFirstStateFullW> createState() => _MyFirstStateFullWState();
// }

// class _MyFirstStateFullWState extends State<MyFirstStateFullW> {
//   final PageController _controller = PageController(initialPage: 0);

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: PageView(
//           scrollDirection: Axis.vertical,
//           controller: _controller,
//           children: [Page2(), Page1(), Page3()],
//         ),
//       ),
//     );
//   }
// }

// displayToastMessage(String message) {
//   Fluttertoast.showToast(msg: message);
// }

// //Grid View
// class PcticeN10 extends StatelessWidget {
//   const PcticeN10({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.count(
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 10,
//               crossAxisCount: 2,
//               children: [
//                 Container(
//                   color: Colors.amberAccent,
//                   height: 250,
//                   width: 250,
//                   child: Image.asset("images/test.jpg"),
//                 ),
//                 Container(
//                   height: double.infinity,
//                   width: 250,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("images/img1.jpg"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Hello 02!",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 Container(color: Colors.cyan, height: 250, width: 250),
//                 Container(
//                   height: double.infinity,
//                   width: 250,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("images/img2.jpg"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // ignore: avoid_print
//                         print("You press me");

//                         displayToastMessage("Hello !!! ");
//                       },
//                       child: Row(
//                         children: const [
//                           Text("Click Me"),
//                           SizedBox(width: 5),
//                           Icon(
//                             Icons.access_alarm,
//                             size: 50.0,
//                             color: Colors.red,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 Container(
//                   color: Colors.teal,
//                   height: 250,
//                   width: 250,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       displayToastMessage("Hello Bangladesh!!! ");
//                     },
//                     child: Text("Button"),
//                   ),
//                 ),

//                 Container(color: Colors.amberAccent, height: 250, width: 250),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //Card View
// class PracticeN9 extends StatefulWidget {
//   const PracticeN9({super.key});

//   @override
//   State<PracticeN9> createState() => _PracticeN9State();
// }

// class _PracticeN9State extends State<PracticeN9> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           body: Center(
//             child: Card(
//               elevation: 50,
//               shape: RoundedRectangleBorder(
//                 // borderRadius: BorderRadius.all(
//                 //   Radius.circular(20),
//                 // ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // LiquidSwipe--- Page change style
// class PracticeN8 extends StatelessWidget {
//   const PracticeN8({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final pages2 = [
//       Container(
//         color: Colors.amberAccent,
//         height: double.infinity,
//         width: double.infinity,
//         child: Image.asset("images/test.jpg"),
//       ),
//       Container(
//         color: Colors.cyan,
//         height: double.infinity,
//         width: double.infinity,
//         child: Image.asset("images/img1.jpg"),
//       ),
//       Container(
//         color: Colors.teal,
//         height: double.infinity,
//         width: double.infinity,
//         child: Image.asset("images/img2.jpg"),
//       ),
//       Container(
//         color: Colors.amberAccent,
//         height: double.infinity,
//         width: double.infinity,
//         child: Image.asset("images/test.jpg"),
//       ),
//       Container(
//         color: Colors.cyan,
//         height: double.infinity,
//         width: double.infinity,
//         child: Image.asset("images/img1.jpg"),
//       ),
//       Container(
//         color: Colors.teal,
//         height: double.infinity,
//         width: double.infinity,
//         child: Image.asset("images/img2.jpg"),
//       ),
//     ];

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(child: Scaffold(body: LiquidSwipe(pages: pages2))),
//     );
//   }
// }

// //Show Image

// //Stack  It used to create weget up above another weget.
// class PracticeN6 extends StatelessWidget {
//   const PracticeN6({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           body: Center(
//             child: Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width,
//                   color: Colors.green,
//                 ),
//                 Positioned(
//                   bottom: 65,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.red,
//                     radius: MediaQuery.of(context).size.width / 6,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //ListTail It used to design a list of data
// class PracticeN5 extends StatelessWidget {
//   const PracticeN5({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           body: ListView(
//             children: [
//               ListTile(
//                 title: Text("ABC"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.call),
//               ),
//               ListTile(
//                 title: Text("DEF"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.call),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.call)),
//                 trailing: Icon(Icons.call),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.call),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//               ListTile(
//                 title: Text("List Tile 1"),
//                 subtitle: Text("ListTile practice with saiful.."),
//                 leading: CircleAvatar(child: Icon(Icons.add_call)),
//                 trailing: Icon(Icons.account_circle),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // MediaQuery use to make responsive UI
// class PracticeN4 extends StatelessWidget {
//   const PracticeN4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;

//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           body: Center(
//             child: Container(
//               height: MediaQuery.of(context).size.height / 5,
//               width: MediaQuery.of(context).size.width / 3,
//               color: Colors.yellow,
//               child: const Center(
//                 child: Text(
//                   "Hello",
//                   style: TextStyle(
//                     color: Colors.cyan,
//                     fontSize: 40.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //List View
// class PracticeN3 extends StatelessWidget {
//   const PracticeN3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           body: ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   height: 200,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Container(
//                           color: Colors.amberAccent,
//                           height: double.infinity,
//                           width: 100,
//                         ),
//                         Container(
//                           color: Colors.purpleAccent,
//                           height: double.infinity,
//                           width: 100,
//                         ),
//                         Container(
//                           color: Colors.lightGreenAccent,
//                           height: double.infinity,
//                           width: 100,
//                         ),
//                         Container(
//                           color: Colors.green,
//                           height: double.infinity,
//                           width: 100,
//                         ),
//                         Container(
//                           color: Colors.white,
//                           height: double.infinity,
//                           width: 100,
//                         ),
//                         Container(
//                           color: Colors.deepPurple,
//                           height: double.infinity,
//                           width: 100,
//                         ),
//                         Container(
//                           color: Colors.grey,
//                           height: double.infinity,
//                           width: 100,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   height: 250,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Container(
//                           height: double.infinity,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("images/img1.jpg"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Hello 02!",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           color: Colors.purpleAccent,
//                           height: double.infinity,
//                           width: 100,
//                           child: Center(child: Text("Hello 02!")),
//                         ),
//                         Container(
//                           color: Colors.lightGreenAccent,
//                           height: double.infinity,
//                           width: 100,
//                           child: Center(child: Text("Hello 03!")),
//                         ),
//                         Container(
//                           color: Colors.green,
//                           height: double.infinity,
//                           width: 100,
//                           child: Center(child: Text("Hello 04!")),
//                         ),
//                         Container(
//                           color: Colors.white,
//                           height: double.infinity,
//                           width: 100,
//                           child: Center(child: Text("Hello 05!")),
//                         ),
//                         Container(
//                           color: Colors.deepPurple,
//                           height: double.infinity,
//                           width: 100,
//                           child: Center(child: Text("Hello 05!")),
//                         ),
//                         Container(
//                           color: Colors.grey,
//                           height: double.infinity,
//                           width: 100,
//                           child: Center(child: Text("Hello 06!")),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(color: Colors.cyan, height: 250, width: 250),
//               Image.asset("images/test.jpg"),
//               Text("Bangladesh", style: TextStyle(fontSize: 100)),
//               Container(color: Colors.teal, height: 250, width: 250),
//               Container(color: Colors.amberAccent, height: 250, width: 250),
//               Container(color: Colors.cyan, height: 250, width: 250),
//               Container(color: Colors.teal, height: 250, width: 250),
//               Container(color: Colors.amberAccent, height: 250, width: 250),
//               Container(color: Colors.cyan, height: 250, width: 250),
//               Container(color: Colors.teal, height: 250, width: 250),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //Column
// class Practice03 extends StatelessWidget {
//   const Practice03({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView(
//           children: [
//             Container(height: 100.0, color: Colors.blueAccent),
//             Container(
//               height: 200.0,
//               width: double.infinity,
//               color: Colors.redAccent,
//             ),
//             Container(
//               height: 200.0,
//               width: double.infinity,
//               color: Colors.green,
//             ),
//             Container(
//               height: 100.0,
//               width: double.infinity,
//               color: Colors.blueAccent,
//             ),
//             Container(
//               height: 200.0,
//               width: double.infinity,
//               color: Colors.redAccent,
//             ),
//             Container(
//               height: 200.0,
//               width: double.infinity,
//               color: Colors.green,
//             ),
//             Text(
//               "Hello",
//               style: TextStyle(
//                 color: Colors.cyan,
//                 fontSize: 40.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 print("object");
//               },
//               icon: Icon(Icons.add_to_drive),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Practice02 extends StatelessWidget {
//   const Practice02({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           body: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Container(
//                   color: Colors.amberAccent,
//                   height: double.infinity,
//                   width: 100,
//                 ),
//                 Container(
//                   color: Colors.purpleAccent,
//                   height: double.infinity,
//                   width: 100,
//                 ),
//                 Container(
//                   color: Colors.lightGreenAccent,
//                   height: double.infinity,
//                   width: 100,
//                 ),
//                 Container(
//                   color: Colors.green,
//                   height: double.infinity,
//                   width: 100,
//                 ),
//                 Container(
//                   color: Colors.white,
//                   height: double.infinity,
//                   width: 100,
//                 ),
//                 Container(
//                   color: Colors.deepPurple,
//                   height: double.infinity,
//                   width: 100,
//                 ),
//                 Container(
//                   color: Colors.grey,
//                   height: double.infinity,
//                   width: 100,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //Row
// class PracticeN2 extends StatelessWidget {
//   const PracticeN2({super.key});

//   // get controller => null;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               Container(
//                 color: Colors.amberAccent,
//                 height: double.infinity,
//                 width: 100,
//               ),
//               Container(
//                 color: Colors.cyan,
//                 width: 100.0,
//                 height: double.infinity,
//               ),
//               Container(
//                 color: Colors.teal,
//                 width: 100.0,
//                 height: double.infinity,
//               ),
//               Container(
//                 color: Colors.amberAccent,
//                 width: 100.0,
//                 height: double.infinity,
//               ),
//               Container(
//                 color: Colors.cyan,
//                 width: 100.0,
//                 height: double.infinity,
//               ),
//               Container(
//                 color: Colors.teal,
//                 width: 100.0,
//                 height: double.infinity,
//               ),
//               Container(
//                 color: Colors.amberAccent,
//                 width: 100.0,
//                 height: double.infinity,
//               ),
//               Container(
//                 color: Colors.cyan,
//                 width: 100.0,
//                 height: double.infinity,
//               ),
//               Container(
//                 color: Colors.teal,
//                 width: 100.0,
//                 height: double.infinity,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //Safe Area
// class PracticeN1 extends StatelessWidget {
//   const PracticeN1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           body: Container(
//             height: double.infinity,
//             width: 200.0,
//             color: Colors.yellow,
//             child: const Center(
//               child: Text(
//                 "Hello",
//                 style: TextStyle(
//                   color: Colors.cyan,
//                   fontSize: 40.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
