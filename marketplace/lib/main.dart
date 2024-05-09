import 'package:flutter/material.dart';
import 'package:marketplace/detail_product.dart';
import 'package:marketplace/chart.dart';
import 'package:marketplace/model/product.dart';
import 'package:marketplace/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProductProvider>(context);
    // print('JSON: $value');

    print(value.products);
    if (value.products.isEmpty) {
      value.fetchData();
    }
    
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

// class Product {
//   final String name;
//   final String imagePath;
//   final double price;
//   final String desc;
//   final String category;

//   Product({required this.name, required this.imagePath, required this.price, required this.desc, required this.category});
// }

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List<Product> products = [
  //   Product(name: 'Product 1', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 2', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 3', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 4', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 5', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 6', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 7', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 8', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 9', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   Product(name: 'Product 10', imagePath: 'assets/image1.jpg', price: 30, desc: 'loyem ipcum', category: 'fashion'),
  //   // Add more products here
  // ];

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
      body: Consumer<ProductProvider>(
        builder: (context, value, _) {
          if(value.products.isEmpty){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return GridView.count(
              crossAxisCount: 2, // biar setiap row hanya nampilin 2 produk
              childAspectRatio: productWidth / (productWidth + 100), // atur tinggi rownya
              // loop data produk
              children: value.products.map((product) {
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
                      color: Colors.white, // Atur warna latar belakang sesuai kebutuhan
                      borderRadius: BorderRadius.circular(10), // Atur border radius sesuai kebutuhan
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                           width: productWidth * 0.7, // Mengambil 70% dari lebar kolom
                          height: productWidth * 0.7,
                          // width: productWidth/2,
                          // height: productWidth,
                          
                          child: Image.network(
                            product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                product.title,
                                maxLines: 1, // Atur jumlah maksimum baris menjadi 2
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '\$${product.price}',
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
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
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
      if (_selectedIndex == 1) {
        // Jika tombol chart diklik, navigasi ke halaman ChartPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChartPage()),
        );
      }
    });
  }
}
