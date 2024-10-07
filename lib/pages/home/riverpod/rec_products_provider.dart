

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/products_model.dart';
import 'fetch_rec_products.dart';

final recProductsProvider =
FutureProvider<List<ProductsModel>>((ref) async {
  return await fetchRecProducts();
});