import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/errors/exceptions.dart';
import 'package:merchant_app/core/errors/failure.dart';
import 'package:merchant_app/features/products/data/datasources/data_local_data_source.dart';
import 'package:merchant_app/features/products/data/datasources/data_remote_data_source.dart';
import 'package:merchant_app/features/products/domain/entities/products.dart';
import 'package:merchant_app/features/products/domain/repositories/data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  DataRemoteDataSource remoteDataSource;
  DataLocalDataSource localDataSource;

  DataRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<String>>> getUniqueTags() async {
    try {
      final remoteData = await localDataSource.getUniqueTags();

      return Right(remoteData);
    } on Exception {
      return const Left(BadRequestFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getCategorisedProducts(
      String tag) async {
    try {
      final data = await localDataSource.getCategorisedProducts(tag);

      return Right(data);
    } on Exception {
      return const Left(BadRequestFailure());
    }
  }

  @override
  Future<Either<Failure, void>> getAllProducts() async {
    try {
      final res = await remoteDataSource.getAllProducts();

      return Right(res);
    } on Exception {
      return const Left(BadRequestFailure());
    }
  }
}
