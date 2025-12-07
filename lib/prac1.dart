
import 'package:ay_app/ecom/ecom2.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Light Theme
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.deepOrange.shade50,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),

      // Dark Theme
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(255, 80, 208, 88),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),

      themeMode: ThemeMode.system,
      home: MyApp2(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Theme Test")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Text("ABC", style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}

class Youtube extends StatefulWidget {
  const Youtube({super.key});

  @override
  State<Youtube> createState() => _YoutubeState();
}

int _currentPage = 0;

final List<Widget> _pages = [
  HomePage(),
  ShortsPage(),
  AddPage(),
  SubscriptionsPage(),
  LibraryPage(),
];

class _YoutubeState extends State<Youtube> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: "Shorts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "Subscriptions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Library",
          ),
        ],
      ),
    );
  }
}

class YoutubeBottomNav extends StatefulWidget {
  @override
  State<YoutubeBottomNav> createState() => _YoutubeBottomNavState();
}

class _YoutubeBottomNavState extends State<YoutubeBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ShortsPage(),
    AddPage(),
    SubscriptionsPage(),
    LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: "Shorts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "Subscriptions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Library",
          ),
        ],
      ),
    );
  }
}

class ShortsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Shorts Page 🎬", style: TextStyle(fontSize: 25)),
    );
  }
}

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Upload or Add Content ➕", style: TextStyle(fontSize: 25)),
    );
  }
}

class SubscriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Subscriptions 🔔", style: TextStyle(fontSize: 25)),
    );
  }
}

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Library 📚", style: TextStyle(fontSize: 25)));
  }
}

// MySnackBar(message, context) {
//   return ScaffoldMessenger.of(
//     context,
//   ).showSnackBar(SnackBar(content: Text(message)));
// }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  // MySnackBar(message, context) {
  //   return ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text(message)));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        titleSpacing: 2,
        // centerTitle: true,
        toolbarHeight: 60,
        //Defoult height 60
        toolbarOpacity: 1,
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 51, 71, 88),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // MySnackBar("1nd Button", context);
        //       print("aaaa");
        //     },
        //     icon: Icon(Icons.account_balance),
        //   ),
        //   IconButton(
        //     onPressed: () {
        //       // MySnackBar("2nd Button", context);
        //       print("accessibility");
        //     },
        //     icon: Icon(Icons.accessibility),
        //   ),
        //   IconButton(
        //     onPressed: () {
        //       // MySnackBar("3nd Button", context);
        //       print("accessibility");
        //     },
        //     icon: Icon(Icons.accessible_forward),
        //   ),
        //   IconButton(
        //     onPressed: () {
        //       print("accessibility");
        //     },
        //     icon: Icon(Icons.account_balance_wallet),
        //   ),
        //   IconButton(
        //     onPressed: () {
        //       // MySnackBar("4nd Button", context);
        //       print("accessibility");
        //     },
        //     icon: Icon(Icons.add_to_drive),
        //   ),
        // ],
      ),
      body: Center(child: Text("Hello World")),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              // decoration: BoxDecoration(color: Colors.green),
              accountName: Text(
                "Pinkesh Darji",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "pinkesh.earth@gmail.com",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.train),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            AboutListTile(
              // <-- SEE HERE
              icon: Icon(Icons.info),
              applicationIcon: Icon(Icons.local_play),
              applicationName: 'My Cool App',
              applicationVersion: '1.0.25',
              applicationLegalese: '© 2019 Company',
              aboutBoxChildren: [
                ///Content goes here...
              ],
              child: Text('About app'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Log-Out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.account_balance),
              ),
              IconButton(
                onPressed: () {
                  // MySnackBar("1nd Button", context);
                  // print("aaaa");
                },
                icon: Icon(Icons.accessible_sharp),
              ),
            ],
          ),
        ),
      ), // AppBer button is not working
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // MySnackBar("floatingActionButton", context);
        },
        elevation: 10,
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add_box_rounded),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> MySnackBar(
    message,
    context,
  ) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App 22"),
          titleSpacing: 10,
          // centerTitle: true,
          toolbarHeight: 60,
          //Defoult height 60
          toolbarOpacity: 1,
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 51, 71, 88),
          actions: [
            IconButton(
              onPressed: () {
                MySnackBar("1nd Button", context);
                // print("aaaa");
              },
              icon: Icon(Icons.account_balance),
            ),
            IconButton(
              onPressed: () {
                MySnackBar("2nd Button", context);
              },
              icon: Icon(Icons.accessibility),
            ),
            IconButton(
              onPressed: () {
                MySnackBar("3nd Button", context);
              },
              icon: Icon(Icons.accessible_forward),
            ),
            IconButton(
              onPressed: () {
                MySnackBar("4nd Button", context);
              },
              icon: Icon(Icons.account_balance_wallet),
            ),
            IconButton(
              onPressed: () {
                MySnackBar("4nd Button", context);
              },
              icon: Icon(Icons.add_to_drive),
            ),
          ],
        ),
        body: Center(child: Text("Hello World")),
        drawer: Container(),
        endDrawer: Container(),
        bottomNavigationBar: Container(),
        floatingActionButton: BackButton(),
      ),
    );
  }
}

class Practice2 extends StatelessWidget {
  const Practice2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: double.infinity,
            width: 200.0,
            color: Colors.yellow,
            child: const Center(
              child: Text(
                "Hello",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Column
class Practice3 extends StatelessWidget {
  const Practice3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100.0,
                  width: double.infinity,
                  color: Colors.blueAccent,
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.redAccent,
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.green,
                ),
                Text(
                  "Hello",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  height: 100.0,
                  width: double.infinity,
                  color: Colors.blueAccent,
                ),
                IconButton(
                  onPressed: () {
                    print("object");
                  },
                  icon: Icon(Icons.add_to_drive),
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.redAccent,
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.green,
                ),
                Text(
                  "Hello",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("object");
                  },
                  icon: Icon(Icons.add_to_drive),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Row
class Practice4_ extends StatelessWidget {
  const Practice4_({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          title: const Text("SafeArea Example"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(flex: 4, child: Container(color: Colors.redAccent)),
              Expanded(flex: 2, child: Container(color: Colors.greenAccent)),
              Expanded(flex: 1, child: Container(color: Colors.orangeAccent)),
            ],
          ),
        ),
      ),
    );
  }
}

class Practice4 extends StatelessWidget {
  const Practice4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SafeArea Example"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(color: Colors.redAccent, width: 100.00),
                Container(color: Colors.greenAccent, width: 100.00),
                Container(color: Colors.orangeAccent, width: 100.00),
                Container(color: Colors.redAccent, width: 100.00),
                Container(color: Colors.greenAccent, width: 100.00),
                Container(color: Colors.orangeAccent, width: 100.00),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//Another design with Main method;

//main
// void main() => runApp(const Practice5());
// SingleChildScrollView---> To Make It Scrollable
class Practice5 extends StatelessWidget {
  const Practice5({super.key});

  Null get controller => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.amberAccent,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.cyan,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.teal,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.amberAccent,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.cyan,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.teal,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.amberAccent,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.cyan,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.teal,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.deepOrangeAccent,
                height: 100.0,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print("object");
                      },
                      icon: Icon(Icons.add_to_drive),
                    ),
                    IconButton(
                      onPressed: () {
                        print("object");
                      },
                      icon: Icon(Icons.abc_rounded),
                    ),
                    IconButton(
                      onPressed: () {
                        print("object");
                      },
                      icon: Icon(Icons.access_alarm_sharp),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.lightGreenAccent,
                height: 100.0,
                width: double.infinity,
              ),
              Container(
                color: Colors.purpleAccent,
                height: 100.0,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Dynamic hight (Expanded) without scrol view..
class Practice6 extends StatelessWidget {
  const Practice6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              //Expanded weget must be a chid of column or row
              flex: 5, //Take double space then other w
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.blueAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Pading --(Expanded)
class Practice7 extends StatelessWidget {
  const Practice7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              //Expanded weget must be a chid of column or row
              flex: 2, //Take double space then other w
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Pading --(Expanded)
class Practice8 extends StatelessWidget {
  const Practice8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              //Expanded weget must be a chid of column or row
              flex: 2, //Take double space then other w
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//ElevatedButton --(Expanded)
class Practice9 extends StatelessWidget {
  const Practice9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("You press me");
              // MySnackBar("Click Me!!!", context);
            },
            child: Row(
              children: [
                const Text(
                  "Click Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.account_balance_sharp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TextButton --(Expanded)
class Practice10 extends StatelessWidget {
  const Practice10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () {
                // ignore: avoid_print
                print("You press me");
              },
              child: const Text(
                "Click Me",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Icon --(Expanded)
class Practice11 extends StatelessWidget {
  const Practice11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Icon!", style: TextStyle(fontSize: 50)),
                    SizedBox(width: 5),
                    const Icon(
                      Icons.access_alarm,
                      size: 50.0,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5),
                    Text("Icon!", style: TextStyle(fontSize: 50)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Icon!", style: TextStyle(fontSize: 50)),
                    SizedBox(width: 5),
                    const Icon(
                      Icons.access_alarm,
                      size: 50.0,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5),
                    Text("Icon!", style: TextStyle(fontSize: 50)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Icon!", style: TextStyle(fontSize: 50)),
                    SizedBox(width: 5),
                    const Icon(
                      Icons.access_alarm,
                      size: 50.0,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5),
                    Text("Icon!", style: TextStyle(fontSize: 50)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Icon!", style: TextStyle(fontSize: 50)),
                    SizedBox(width: 5),
                    const Icon(
                      Icons.access_alarm,
                      size: 50.0,
                      color: Colors.red,
                    ),
                    SizedBox(width: 5),
                    Text("Icon!", style: TextStyle(fontSize: 50)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Icon!", style: TextStyle(fontSize: 50)),
                  SizedBox(width: 5),
                  const Icon(Icons.access_alarm, size: 50.0, color: Colors.red),
                  SizedBox(width: 5),
                  Text("Icon!", style: TextStyle(fontSize: 50)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Icon!", style: TextStyle(fontSize: 50)),
                  SizedBox(width: 5),
                  const Icon(Icons.access_alarm, size: 50.0, color: Colors.red),
                  SizedBox(width: 5),
                  Text("Icon!", style: TextStyle(fontSize: 50)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//ElevatedButton With Icon & SizedBox --(Expanded)
class Practice12 extends StatelessWidget {
  const Practice12({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 150.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {
                // ignore: avoid_print
                print("You press me");
              },
              child: Row(
                children: const [
                  Text("Click Me"),
                  SizedBox(width: 5),
                  Icon(Icons.access_alarm, size: 50.0, color: Colors.red),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///visible wiget// layout wiget

//add image, card, padding
class Practice13 extends StatelessWidget {
  const Practice13({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(
              "https://png.pngtree.com/background/20210711/original/pngtree-fresh-natural-product-poster-background-picture-image_1128887.jpg",
            ),
          ),
        ),
      ),
    );
  }
}

//add image, card, padding
class Practice13a extends StatelessWidget {
  const Practice13a({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("images/img2.jpg"),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(PracticeN7());
}

class PracticeN7 extends StatelessWidget {
  const PracticeN7({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(body: Center(child: Image.asset("images/test.jpg"))),
      ),
    );
  }
}

//add cercle
class Practice14 extends StatelessWidget {
  const Practice14({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/test.jpg"),
              radius: 70.0,
              // child: Icon(
              //   Icons.abc_sharp,
              //   size: 40.0,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

//add cercle
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

//App ber modifications
class Practice15 extends StatelessWidget {
  const Practice15({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Title"),
          leading: const Icon(Icons.ac_unit_sharp),
          actions: const [
            Icon(Icons.access_alarm_rounded),
            Icon(Icons.access_alarms_rounded),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.ac_unit_sharp),
        ),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}

class Practice16 extends StatelessWidget {
  const Practice16({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Title"),
          leading: const Icon(Icons.ac_unit_sharp),
          actions: const [
            Icon(Icons.access_alarm_rounded),
            Icon(Icons.access_alarms_rounded),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.ac_unit_sharp),
        ),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
