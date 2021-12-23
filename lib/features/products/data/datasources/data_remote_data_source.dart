import 'dart:convert';

import 'package:merchant_app/core/utils/local_keys.dart';
import 'package:merchant_app/core/utils/local_storage/shared_preference_client.dart';
import 'package:merchant_app/core/utils/network/dio_client.dart';
import 'package:merchant_app/features/products/data/models/products_model.dart';

abstract class DataRemoteDataSource {
  Future<void> getAllProducts();
}

class DataRemoteDataSourceImpl implements DataRemoteDataSource {
  DioClient client;
  SharedPreferenceLocalStorage storage;

  DataRemoteDataSourceImpl({
    required this.client,
    required this.storage,
  });

  @override
  Future<void> getAllProducts() async {
    Map<String, dynamic> params = {};
    final response = await client.get(params: params);
    ProductsModel data = const ProductsModel();
    if (response != null) {
      data = ProductsModel.fromJson(response.data!);
      await storage.setString(productsKey, jsonEncode(data.toJson()));
    }
  }
}
