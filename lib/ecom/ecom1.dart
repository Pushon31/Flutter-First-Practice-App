import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* =======================
   ROOT APP
======================= */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcommerceHomePage(),
    );
  }
}

/* =======================
   E-COMMERCE HOME PAGE
======================= */
class EcommerceHomePage extends StatelessWidget {
  const EcommerceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      /* -------- AppBar -------- */
      appBar: AppBar(
        title: const Text("ShopEasy"),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* -------- Search Bar -------- */
            TextField(
              decoration: InputDecoration(
                hintText: "Search products",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /* -------- Categories -------- */
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(label: "All"),
                  CategoryChip(label: "Shoes"),
                  CategoryChip(label: "Clothes"),
                  CategoryChip(label: "Electronics"),
                  CategoryChip(label: "Accessories"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /* -------- Products -------- */
            const Text(
              "Popular Products",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
                children: const [
                  ProductCard(name: "Running Shoes", price: 59.99),
                  ProductCard(name: "Smart Watch", price: 99.99),
                  ProductCard(name: "Headphone", price: 49.99),
                  ProductCard(name: "T-Shirt", price: 19.99),
                  ProductCard(name: "Running Shoes", price: 59.99),
                  ProductCard(name: "Smart Watch", price: 99.99),
                  ProductCard(name: "Headphone", price: 49.99),
                  ProductCard(name: "T-Shirt", price: 19.99),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =======================
   CATEGORY CHIP
======================= */
class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(label: Text(label), backgroundColor: Colors.white),
    );
  }
}

/* =======================
   PRODUCT CARD
======================= */
class ProductCard extends StatelessWidget {
  final String name;
  final double price;

  const ProductCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fake image placeholder
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: const Center(child: Icon(Icons.image, size: 50)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "\$${price.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
