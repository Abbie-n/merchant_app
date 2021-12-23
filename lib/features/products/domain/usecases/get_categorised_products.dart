import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/errors/failure.dart';
import 'package:merchant_app/core/usescases/usecase.dart';
import 'package:merchant_app/features/products/domain/entities/products.dart';
import 'package:merchant_app/features/products/domain/repositories/data_repository.dart';

class GetCategorisedProductsUseCase implements UseCase<List<Product>, String> {
  final DataRepository repository;

  GetCategorisedProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(String params) async {
    return await repository.getCategorisedProducts(params);
  }
}
