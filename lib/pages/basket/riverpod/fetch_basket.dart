

import 'package:tashkentcityresturant/models/products_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<ProductsModel>> fetchBaskets() async {
  final url = Uri.parse('https://api.xn--80akjaht2adec3d.xn--p1ai/api/product?category_id=16');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      List<ProductsModel> products = jsonData
          .map((jsonItem) => ProductsModel.fromJson(jsonItem))
          .toList();

      return products;
    } else {
      throw Exception('Ma\'lumotlarni olishda xatolik: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Ma\'lumotlarni olishda xatolik: $e');
  }
}