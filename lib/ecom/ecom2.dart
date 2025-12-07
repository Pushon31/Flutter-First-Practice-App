import 'package:flutter/material.dart';

void main() {
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce Demo",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> categories = [
    "All",
    "Electronics",
    "Fashion",
    "Beauty",
    "Home",
    "Sports",
  ];

  final List<Map<String, String>> products = List.generate(
    10,
    (index) => {
      "name": "Product ${index + 1}",
      "image": "https://picsum.photos/200/200?random=${index + 1}",
      "price": "\$${(index + 1) * 10}"
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Cart tapped")));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- Search Bar ----------------
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

            // ---------------- Categories ----------------
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return Chip(
                    label: Text(categories[index]),
                    backgroundColor: Colors.deepOrange.shade100,
                  );
                },
              ),
            ),
            SizedBox(height: 12),

            // ---------------- Products Grid ----------------
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    name: product["name"]!,
                    image: product["image"]!,
                    price: product["price"]!,
                    onAddToCart: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${product["name"]} added!")),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ---------------- Bottom Navigation ----------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (val) => setState(() => _selectedIndex = val),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ---------------- Product Card ----------------
class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(image, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(price, style: TextStyle(color: Colors.green)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 36),
              ),
              child: Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
