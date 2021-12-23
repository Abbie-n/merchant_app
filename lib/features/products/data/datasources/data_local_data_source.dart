import 'package:merchant_app/core/utils/local_keys.dart';
import 'package:merchant_app/core/utils/local_storage/shared_preference_client.dart';
import 'package:merchant_app/features/products/data/models/products_model.dart';

abstract class DataLocalDataSource {
  Future<List<String>> getUniqueTags();
  Future<ProductsModel> getCategorisedProducts();
}

class DataLocalDataSourceImpl implements DataLocalDataSource {
  SharedPreferenceLocalStorage storage;

  DataLocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<List<String>> getUniqueTags() async {
    final String? res = storage.getString(productsKey);
    List<String> data = const <String>[];
    print(res);
    if (res != null) {}

    return data;
  }

  @override
  Future<ProductsModel> getCategorisedProducts() async {
    final String? res = storage.getString(productsKey);
    ProductsModel data = const ProductsModel();
    print(res);
    if (res != null) {
      data = ProductsModel.fromJson(res);
    }

    return data;
  }
}
