import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/models/product_model.dart';

class Crud {
  //final client = http.Client();
  // Future<ProductModel> get(String apiUrl) async {
  //   var response = await client.get(Uri.parse(apiUrl));
  //   var data = jsonDecode(response.body.toString());
  //   print(data.toString() + '      asdfghjk');
  //   return ProductModel.fromJson(data);
  // }
  Future<List<ProductModel>> get(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var products = data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load');
    }
    //print(response.statusCode);
  }

  Future<dynamic> post(String apiUrl) async {
    // car response = http.Client().post(Uri.parse(apiUrl), body: )
  }

  Future<dynamic> put(String apiUrl) async {}

  Future<dynamic> delete(String apiUrl) async {}
}
