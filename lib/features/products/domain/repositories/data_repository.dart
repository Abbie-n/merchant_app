import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/errors/failure.dart';
import 'package:merchant_app/features/products/domain/entities/products.dart';

abstract class DataRepository {
  Future<Either<Failure, List<String>>> getUniqueTags();
  Future<Either<Failure, List<Product>>> getCategorisedProducts(String tag);
  Future<Either<Failure, void>> getAllProducts();
}
