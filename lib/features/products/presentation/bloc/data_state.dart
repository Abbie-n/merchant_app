import 'package:equatable/equatable.dart';
import 'package:merchant_app/features/products/domain/entities/products.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DataState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends DataState {
  Empty();
}

class Loading extends DataState {}

class TagsLoading extends DataState {}

class CategorisedProductsLoading extends DataState {}

class Loaded extends DataState {
  final void data;

  Loaded({required this.data});

  @override
  List<Object> get props => [];
}

class TagsLoaded extends DataState {
  final List<String> data;

  TagsLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class CategorisedProductsLoaded extends DataState {
  final List<Product> data;

  CategorisedProductsLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class Error extends DataState {
  final String? message;

  Error({required this.message});

  @override
  List<Object> get props => [message!];
}
