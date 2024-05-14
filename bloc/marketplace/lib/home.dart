import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/cubit/chart_cubit.dart';
import 'package:marketplace/cubit/product_cubit.dart';
import 'package:marketplace/detail_product.dart';
import 'package:marketplace/chart.dart';
import 'package:marketplace/cubit/product.dart';
import 'package:marketplace/cubit/product_list_cubit.dart';
import 'dart:developer' as developer;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool init = false;

  @override
  Widget build(BuildContext context) {
    // var chart = context.read<ChartCubit>();
  
    // Mendapatkan informasi tentang ukuran layar perangkat
    final screenWidth = MediaQuery.of(context).size.width;

    // Menghitung lebar widget responsif
    final productWidth = (screenWidth - 24) / 2; // Mengurangi margin dari total lebar layar

    if(!init){
      context.read<ProductListCubit>().fetchData();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Produk"),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ProductListCubit, List<Product>>(
        buildWhen:(previous, current) {
          developer.log(
              '${previous[0].title}->${current[0].title}',
              name: 'log');
          return true;
        },
        builder: (context, value) {
          return GridView.count(
            crossAxisCount: 2, // biar setiap row hanya nampilin 2 produk
            childAspectRatio: productWidth / (productWidth + 100), // atur tinggi rownya
            // loop data produk
            children: value.map((product) {
              return GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) {
                  //   context
                  //       .read<ProductCubit>()
                  //       .fetchData(product.id);
                  //       print("oooooooooooooooo");
                  //   return ProductDetailPage();
                  // }));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProductDetailPage(id: product.id),
                  //   ),
                  // );
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
                                bool productExists = context.read<ChartCubit>().isProductExists(product.id);
                                if (!productExists) {
                                  context.read<ChartCubit>().add(product);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Added to Cart successfully'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Product already exists in the cart'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                }
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
        },
      ),
    );
  }
}