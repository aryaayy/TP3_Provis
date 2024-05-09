import 'package:flutter/material.dart';
import 'package:marketplace/main.dart';
import 'package:marketplace/model/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(product.image),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                  child: Padding(
                    // padding: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                            child: Text(
                              product.category,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          product.title,
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(fontSize: 22.0),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          'Deskripsi Produk:',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          product.description,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: 
            Text(
              'Add to Cart',
              style: TextStyle(fontSize: 24.0),
              ),
          ),
          // Add more details here
        ],
      ),
    );
  }
}
