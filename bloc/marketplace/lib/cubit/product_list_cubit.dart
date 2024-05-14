import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cubit/product.dart';
import 'package:http/http.dart' as http;

class ProductListCubit extends Cubit<List<Product>> {
  String url = "https://fakestoreapi.com/products";
  ProductListCubit()
    : super([
        Product(
          id: "",
          title: "",
          price: "",
          description: "",
          category: "",
          image: "")
    ]);

  void fromJson(List<dynamic> json) {
    List<Product> productList = json
        .map((e) => Product(
          id: e['id'].toString(),
          title: e['title'],
          price: e['price'].toString(),
          description: e['description'],
          category: e['category'],
          image: e['image'],
        )).toList();
    emit(productList);
  }

  Future<void> fetchData() async {
    try {
      print("AAAAAAAAAAAAAAAAA");
      final response = await http.get(Uri.parse(url));
      print("UUUUUUUUUUUUUUUUUU");
      if (response.statusCode == 200) {
        fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}