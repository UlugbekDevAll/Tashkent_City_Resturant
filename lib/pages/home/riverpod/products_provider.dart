


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tashkentcityresturant/models/products_model.dart';
import 'package:tashkentcityresturant/pages/home/riverpod/fetch_products.dart';

final productsProvider =
FutureProvider<List<ProductsModel>>((ref) async {
  return await fetchProducts();
});