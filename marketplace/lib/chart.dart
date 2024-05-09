import 'package:flutter/material.dart';
// import 'package:marketplace/main.dart';

class Product {
  final String name;
  final String imagePath;
  final double price;

  Product({required this.name, required this.imagePath, required this.price});
}

class ChartPage extends StatelessWidget {
  List<Product> products = [
    Product(name: 'Product 1', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 2', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 3', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 4', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 5', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 6', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 7', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 8', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 9', imagePath: 'assets/image1.jpg', price: 30),
    Product(name: 'Product 10', imagePath: 'assets/image1.jpg', price: 30),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        product.imagePath,
                        width: 100,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

