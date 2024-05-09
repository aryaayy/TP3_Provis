import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:marketplace/model/item.dart';
import 'package:http/http.dart' as http;

class ItemProvider extends ChangeNotifier {
  String url = "https://fakestoreapi.com/products";
  List<Item> _items = [];

  List<Item> get items => _items;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> itemList = jsonDecode(response.body)['results'];
        _items = itemList.map((json) => Item.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

// class ItemProvider extends ChangeNotifier {
//   String url = "https://randomitem.me/api/";
//   List<Item> _items = [];

//   // int get totalPrice => _items.length * 10;
//   // List<Item> get items => _items;
//   Item? _itemProvider;

//   Item? get itemData => _itemProvider;

//   Future<void> fetchData() async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final List<dynamic> item = jsonDecode(response.body)['results'][0];
//         _items = Item.fromJson(item);

//         // Infokan bahwa data telah berubah
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//   // final List<Item> _items = [];

//   // int get totalPrice => _items.length * 10;
//   // List<Item> get items => _items;

//   // void add(Item item) {
//   //   _items.add(item);
//   //   // This call tells the widgets that are listening to this model to rebuild.
//   //   notifyListeners();
//   // }

//   // void remove(Item item) {
//   //   _items.remove(item);
//   //   // This call tells the widgets that are listening to this model to rebuild.
//   //   notifyListeners();
//   // }

//   // bool isItemExists(String itemTitle) {
//   //   return _items.any((item) => item.title == itemTitle);
//   // }
// }
