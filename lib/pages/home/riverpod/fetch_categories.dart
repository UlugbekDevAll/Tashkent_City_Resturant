

import '../../../models/products_category_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<ProductsCategoryModel>> fetchCategories() async {
  final url = Uri.parse('https://api.justdev24.ru/api/products/category');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      List<ProductsCategoryModel> categories = jsonData
          .map((jsonItem) => ProductsCategoryModel.fromJson(jsonItem))
          .toList();

      return categories;
    } else {
      throw Exception('Ma\'lumotlarni olishda xatolik: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Ma\'lumotlarni olishda xatolik: $e');
  }
}