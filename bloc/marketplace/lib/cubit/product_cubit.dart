import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cubit/product.dart';
import 'package:http/http.dart' as http;

class ProductCubit extends Cubit<Product> {
  String url = "https://fakestoreapi.com/products/";
  ProductCubit()
    : super(
        Product(
          id: "",
          title: "",
          price: "",
          description: "",
          category: "",
          image: "")
    );

  void fromJson(Map<String, dynamic> json) {
    final id = json['id'].toString();
    final title = json['title'];
    final price = json['price'].toStringAsFixed(2);
    final description = json['description'];
    final category = json['category'];
    final image = json['image'];
    Product product = Product(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
    );
    emit(product);
  }

  Future<void> fetchData(String id) async {
    try {
      final response = await http.get(Uri.parse(url + id));
      print(response.body);
      if (response.statusCode == 200) {
        fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}