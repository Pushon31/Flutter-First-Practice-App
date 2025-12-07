import 'package:flutter/material.dart';

void main() {
  runApp(ProductCardApp());
}

class ProductCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shop Easy"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 12),
              // Wrap horizontal ListView inside a Container (or SizedBox) with fixed height
              SizedBox(
                height: 80, // adjust height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    SizedBox(width: 12),
                    Chip(label: Text('All'),backgroundColor: Colors.amber,),
                    SizedBox(width: 8),
                    Chip(label: Text('Electronics'),backgroundColor: Colors.amber),
                    SizedBox(width: 8),
                    Chip(label: Text('Beauty'),backgroundColor: Colors.amber),
                    SizedBox(width: 8),
                    Chip(label: Text('Clothings'),backgroundColor: Colors.amber),
                    SizedBox(width: 8),
                    Chip(label: Text('Mobile'),backgroundColor: Colors.amber),
                    SizedBox(width: 8),
                    Chip(label: Text('Laptop'),backgroundColor: Colors.amber),
                    SizedBox(width: 8),
                    Chip(label: Text('Others'),backgroundColor: Colors.amber),
                    SizedBox(width: 12),
                  ],
                  
                ),
              ),
              SizedBox(height: 12,),
              
              
            ],
            
            
            
            
          ),
          
        ),
        

      ),
      
    );
  }
}
