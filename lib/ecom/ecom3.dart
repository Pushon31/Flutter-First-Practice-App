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
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
    );
  }
}

// ---------------- Home Page ----------------
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
      "price": "\$${(index + 1) * 10}",
      "description": "This is a detailed description of Product ${index + 1}.",
    },
  );

  final List<Map<String, String>> favorites = [];

  @override
  Widget build(BuildContext context) {
    final pages = [
      buildHomeTab(products),
      FavoritesPage(favorites: favorites),
      ProfilePage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (val) => setState(() => _selectedIndex = val),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget buildHomeTab(List<Map<String, String>> products) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Cart tapped"))),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Search bar
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

            // Categories
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

            // Products Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsPage(
                            product: product,
                            onFavorite: () {
                              setState(() {
                                if (!favorites.contains(product))
                                  favorites.add(product);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Product Card ----------------
class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(price, style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Product Details Page ----------------
class ProductDetailsPage extends StatelessWidget {
  final Map<String, String> product;
  final VoidCallback onFavorite;

  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product["name"]!)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product["image"]!,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product["name"]!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  product["price"]!,
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                SizedBox(height: 12),
                Text(product["description"]!),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    onFavorite();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${product["name"]} added to favorites"),
                      ),
                    );
                  },
                  icon: Icon(Icons.favorite),
                  label: Text("Add to Favorites"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Favorites Page ----------------
class FavoritesPage extends StatelessWidget {
  final List<Map<String, String>> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: favorites.isEmpty
          ? Center(child: Text("No favorites yet!"))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return ListTile(
                  leading: Image.network(product["image"]!),
                  title: Text(product["name"]!),
                  subtitle: Text(product["price"]!),
                );
              },
            ),
    );
  }
}

// ---------------- Profile Page ----------------
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://picsum.photos/100"),
            ),
            SizedBox(height: 12),
            Text(
              "John Doe",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("johndoe@example.com"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Edit Profile Clicked"))),
              child: Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
