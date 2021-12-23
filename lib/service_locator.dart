import 'package:get_it/get_it.dart';
import 'package:merchant_app/core/utils/local_storage/shared_preference_client.dart';
import 'package:merchant_app/core/utils/network/dio_client.dart';
import 'package:merchant_app/core/utils/network/logging.dart';
import 'package:merchant_app/features/products/data/datasources/data_remote_data_source.dart';
import 'package:merchant_app/features/products/data/repositories/data_repository_impl.dart';
import 'package:merchant_app/features/products/domain/repositories/data_repository.dart';
import 'package:merchant_app/features/products/domain/usecases/get_all_products.dart';
import 'package:merchant_app/features/products/domain/usecases/get_categorised_products.dart';
import 'package:merchant_app/features/products/domain/usecases/get_unique_tags.dart';
import 'package:merchant_app/features/products/presentation/bloc/data_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
    () => DataBloc(
      getAllProducts: sl(),
      getCategorisedProducts: sl(),
      getUniqueTags: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetCategorisedProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetUniqueTagsUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<DataRemoteDataSource>(
    () => DataRemoteDataSourceImpl(
      client: sl(),
      storage: sl(),
    ),
  );

  // External
  final sharedPreferenceLocalStorage =
      await SharedPreferenceLocalStorage.getInstance();
  sl.registerSingleton(sharedPreferenceLocalStorage);
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => Logging());
}
