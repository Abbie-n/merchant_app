import 'package:flutter/rendering.dart';
import 'package:merchant_app/core/utils/local_keys.dart';
import 'package:merchant_app/core/utils/local_storage/shared_preference_client.dart';
import 'package:merchant_app/features/products/data/models/products_model.dart';
import 'package:merchant_app/features/products/domain/entities/products.dart';

abstract class DataLocalDataSource {
  Future<List<String>> getUniqueTags();
  Future<List<Product>> getCategorisedProducts(String tag);
}

class DataLocalDataSourceImpl implements DataLocalDataSource {
  SharedPreferenceLocalStorage storage;

  DataLocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<List<String>> getUniqueTags() async {
    ProductsModel model = const ProductsModel();
    final String? res = storage.getString(allProductsKey);
    List<String> data = <String>[];
    if (res != null) {
      model = ProductsModel.fromJson(res);
      for (Product p in model.products!) {
        List<String> tags = [...p.tags!.split(',')];
        for (String tag in tags) {
          data.add(tag.trim());
        }
      }
    }

    data.sort();
    return data.toSet().toList();
  }

  @override
  Future<List<Product>> getCategorisedProducts(String tag) async {
    final String? res = storage.getString(allProductsKey);
    ProductsModel model = const ProductsModel();
    List<Product> data = <Product>[];
    debugPrint('Local 2 ::: $res');
    debugPrint('Tag ::: $tag');
    if (res != null) {
      model = ProductsModel.fromJson(res);

      data = model.products!
          .where((element) =>
              element.tags!.toLowerCase().trim().contains(tag.toLowerCase()))
          .toList();
    }
    print(data.length);
    return data;
  }
}
