

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/products_category_model.dart';
import 'fetch_categories.dart';

final productsCategoryProvider =
FutureProvider<List<ProductsCategoryModel>>((ref) async {
  return await fetchCategories();
});