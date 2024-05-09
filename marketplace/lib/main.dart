import 'package:flutter/material.dart';
import 'package:marketplace/detail_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Produk'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Product {
  final String name;
  final String imagePath;
  final double price;

  Product({required this.name, required this.imagePath, required this.price});
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Product> products = [
    Product(name: 'Product 1', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 2', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 3', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 4', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 5', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 6', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 7', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 8', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 9', imagePath: 'assets/image1.jpg', price: 30000),
    Product(name: 'Product 10', imagePath: 'assets/image1.jpg', price: 30000),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    // Mendapatkan informasi tentang ukuran layar perangkat
    final screenWidth = MediaQuery.of(context).size.width;

    // Menghitung lebar widget responsif
    final productWidth = (screenWidth - 24) / 2; // Mengurangi margin dari total lebar layar

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2, // biar setiap row hanya nampilin 2 produk
        childAspectRatio: productWidth / (productWidth + 100), // atur tinggi rownya
        // loop data produk
        children: List.generate(products.length, (index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: Container(
              width: productWidth,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    product.imagePath,
                    width: productWidth,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          );
        }),

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Chart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
