import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/errors/failure.dart';
import 'package:merchant_app/core/usescases/usecase.dart';
import 'package:merchant_app/features/products/domain/repositories/data_repository.dart';

class GetAllProductsUseCase implements UseCase<void, NoParams> {
  final DataRepository repository;

  GetAllProductsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.getAllProducts();
  }
}
