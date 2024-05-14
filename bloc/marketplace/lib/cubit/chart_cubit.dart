import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/cubit/product.dart';
import 'package:http/http.dart' as http;

class ChartCubit extends Cubit<List<Product>> {
  // String url = "https://fakestoreapi.com/products";
  ChartCubit()
    : super([
        Product(
          id: "",
          title: "",
          price: "",
          description: "",
          category: "",
          image: "")
    ]);

  List<Product> _chart = [];
  List<Product> get chart => _chart;

  void add(Product product) {
    _chart.add(product);
    // This call tells the widgets that are listening to this model to rebuild.
    emit(_chart);
  }

  void remove(Product product) {
    _chart.remove(product);
    // This call tells the widgets that are listening to this model to rebuild.
    emit(_chart);
  }

  bool isProductExists(String productId) {
    return _chart.any((product) => product.id == productId);
  }
}