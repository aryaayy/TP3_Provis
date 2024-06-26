import 'package:flutter/material.dart';
import 'package:marketplace/cubit/chart_cubit.dart';
import 'package:marketplace/main.dart';
import 'package:marketplace/cubit/product_list_cubit.dart';
import 'package:marketplace/cubit/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartCubitPage extends StatefulWidget {
  @override
  _ChartCubitPageState createState() => _ChartCubitPageState();
}

class _ChartCubitPageState extends State<ChartCubitPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var value = context.read<ChartCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false, // Tambahkan baris ini
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: value.chart.length,
              itemBuilder: (context, index) {
                final product = value.chart[index];
                return Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Image.network(
                            product.image, // Use network image
                            // width: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: Text(
                                  product.title,
                                  maxLines: 2, // Atur jumlah maksimum baris menjadi 2
                                overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                value.remove(product);
                              },
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
                        ),
                      ],
                    ),
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
