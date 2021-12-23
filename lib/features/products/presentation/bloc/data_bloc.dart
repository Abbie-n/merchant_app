import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:merchant_app/core/errors/failure.dart';
import 'package:merchant_app/core/usescases/usecase.dart';
import 'package:merchant_app/core/utils/local_storage/shared_preference_client.dart';
import 'package:merchant_app/features/products/domain/usecases/get_all_products.dart';
import 'package:merchant_app/features/products/domain/usecases/get_categorised_products.dart';
import 'package:merchant_app/features/products/domain/usecases/get_unique_tags.dart';
import 'package:merchant_app/features/products/presentation/bloc/bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  GetAllProductsUseCase? getAllProducts;
  GetCategorisedProductsUseCase? getCategorisedProducts;
  GetUniqueTagsUseCase? getUniqueTags;
  SharedPreferenceLocalStorage localStorage = SharedPreferenceLocalStorage();

  DataBloc({
    this.getAllProducts,
    this.getCategorisedProducts,
    this.getUniqueTags,
  }) : super(Empty());

  DataState get initialState => Empty();

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is GetAllProducts) {
      yield Loading();
      final res = await getAllProducts!(NoParams());
      yield res.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (res) => Loaded(),
      );
    } else if (event is GetUniqueTags) {
      yield TagsLoading();
      final res = await getUniqueTags!(NoParams());
      yield res.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (res) => TagsLoaded(data: res),
      );
    } else if (event is GetCategorisedProducts) {
      yield CategorisedProductsLoading();
      final res = await getCategorisedProducts!(event.tag);
      yield res.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (res) => CategorisedProductsLoaded(data: res),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return const NetworkFailure().message!;
      case BadRequestFailure:
        return const BadRequestFailure().message!;
      default:
        return const ServerFailure().message!;
    }
  }
}
