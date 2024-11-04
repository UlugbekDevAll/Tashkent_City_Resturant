

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tashkentcityresturant/models/products_model.dart';
import 'package:tashkentcityresturant/pages/basket/riverpod/fetch_basket.dart';

import '../../../models/products_category_model.dart';

final productsBasketProvider =
FutureProvider<List<ProductsModel>>((ref) async {
  return await fetchBaskets();
});