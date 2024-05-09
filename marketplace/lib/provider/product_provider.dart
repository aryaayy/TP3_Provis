import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:marketplace/model/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  String url = "https://fakestoreapi.com/products";
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        final List<dynamic> productList = jsonDecode(response.body);
        // print(productList);
        _products = productList.map((json) => Product.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}