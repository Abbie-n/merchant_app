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
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Products>> getCategorisedProducts() async {
    try {
      final remoteData = await localDataSource.getCategorisedProducts();

      return Right(remoteData);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> getAllProducts() async {
    try {
      final remoteData = await localDataSource.getCategorisedProducts();

      return Right(remoteData);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
