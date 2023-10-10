import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product.dart';

class Api{

  Future getProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e)=>Product(id: e['id'], title: e['title'], category: e['category'],price: e['price'],
            description: e['description'], image: e['image'], rating: Rating(rate: e['rating']['rate'],count: e['rating']['count']))).toList();
      } else {
        return "error";
      }
    } catch (Exception) {
      print("exception" + Exception.toString());
    }
  }

  Future getSingleProduct(id) async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/${id}'),
      );

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        return Product(id: data['id'], title: data['title'], category: data['category'],price: data['price'],
            description: data['description'], image: data['image'], rating: Rating(rate: data['rating']['rate'],count: data['rating']['count']));
      } else {
        return "error";
      }
    } catch (Exception) {
      print("exception" + Exception.toString());
    }
  }
}