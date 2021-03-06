import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/errors/failure.dart';
import 'package:merchant_app/core/usescases/usecase.dart';
import 'package:merchant_app/features/products/domain/repositories/data_repository.dart';

class GetUniqueTagsUseCase implements UseCase<List<String>, NoParams> {
  final DataRepository repository;

  GetUniqueTagsUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await repository.getUniqueTags();
  }
}
