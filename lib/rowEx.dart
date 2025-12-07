import 'package:flutter/material.dart';

void main() {
  runApp(MultiWidgetRowApp());
}

class MultiWidgetRowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiWidgetRowPage(),
    );
  }
}

class MultiWidgetRowPage extends StatefulWidget {
  @override
  State<MultiWidgetRowPage> createState() => _MultiWidgetRowPageState();
}

class _MultiWidgetRowPageState extends State<MultiWidgetRowPage> {
  final ScrollController _scrollController = ScrollController();
  final double itemWidth = 140; // width of each child
  final int initialIndex = 3;   // index to scroll on load

  @override
  void initState() {
    super.initState();

    // Scroll to initial index after layout is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(itemWidth * initialIndex.toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi-widget Row Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            children: List.generate(10, (index) {
              // Alternate widget types
              switch (index % 3) {
                case 0:
                  return Container(
                    width: itemWidth,
                    height: 120,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.redAccent,
                    child: Center(
                      child: Text("Container $index", style: TextStyle(color: Colors.white)),
                    ),
                  );
                case 1:
                  return ElevatedButton(
                    onPressed: () => print("Button $index pressed"),
                    child: Text("Button $index"),
                  );
                case 2:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 50, color: Colors.blue),
                      SizedBox(height: 8),
                      Text("Image $index")
                    ],
                  );
                default:
                  return SizedBox();
              }
            }),
          ),
        ),
      ),
    );
  }
}
