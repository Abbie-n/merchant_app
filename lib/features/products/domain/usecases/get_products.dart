import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/errors/failure.dart';
import 'package:merchant_app/core/usescases/usecase.dart';
import 'package:merchant_app/features/products/domain/entities/products.dart';
import 'package:merchant_app/features/products/domain/repositories/data_repository.dart';

class GetProductsUseCase implements UseCase<Products, NoParams> {
  final DataRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, Products>> call(NoParams params) async {
    return await repository.getProducts();
  }
}