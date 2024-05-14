import 'package:flutter/material.dart';
import 'package:marketplace/cubit/chart_cubit.dart';
import 'package:marketplace/cubit/product_cubit.dart';
import 'package:marketplace/main.dart';
import 'package:marketplace/cubit/product.dart';
import 'package:marketplace/cubit/product_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  @override
  Widget build(BuildContext context) {
    // var chart = context.read<ChartCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ProductCubit, Product>(
          buildWhen: (previous, current) {
            developer.log('${previous.title}->${current.title}',
                name: 'log');
            return true;
          }, builder: (context, value){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.network(value.image, fit: BoxFit.contain,)),
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
                                    value.category,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                value.title,
                                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '\$${value.price}',
                                style: TextStyle(fontSize: 22.0),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Deskripsi Produk:',
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                value.description,
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
                    // dynamic reader = chart
                    // bool productExists = chart.isProductExists(value.id);
                    //   if (!productExists) {
                    //     chart.add(value);

                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text('Added to ChartCubit successfully'),
                    //         duration: Duration(seconds: 1),
                    //       ),
                    //     );
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text('Product already exists in the chart'),
                    //         duration: Duration(seconds: 1),
                    //       ),
                    //     );
                    //   }
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                // Add more details here
              ],
            );
          }
        ),
      )
    );
  }
}

