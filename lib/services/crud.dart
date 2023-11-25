import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/models/product_model.dart';

class Crud {
  Future<List<ProductModel>> get(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var products = data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<dynamic> post(String apiUrl, int id, String title, double price,
      String description, String category, String image, double rate,
      int count) async {
    final response = await http.post(Uri.parse(apiUrl),
        body: jsonEncode({
          "id": id,
          "title": title,
          "price": price,
          "description": description,
          "category": category,
          "image": image,
          "rating": {"rate": rate, "count": count}
        }));
    if(response.statusCode==200 ) {
      return 200;
    } else {
      throw Exception('Failed POST');
    }
  }

  Future<dynamic> patch(String apiUrl, int? id, String? title, double? price,
      String? description, String? category, String? image, double? rate,
      int? count) async {
    final response = await http.patch(Uri.parse("$apiUrl/$id"),
    body: jsonEncode({
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": {"rate": rate, "count": count}
    }));
    if(response.statusCode==200 ) {
      return 200;
    } else {
      throw Exception('Failed POST');
    }
  }

  Future<dynamic> delete(String apiUrl, int? id) async {
    final response = await http.delete(Uri.parse("$apiUrl/$id"));
    if(response.statusCode == 200){
      return 200;
    }
    else{
      throw Exception('Failed to Delete!');
    }
  }
}
