import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DataEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllProducts extends DataEvent {}

class GetUniqueTags extends DataEvent {}

class GetCategorisedProducts extends DataEvent {
  final String tag;

  GetCategorisedProducts(this.tag);

  @override
  List<Object> get props => [tag];

  @override
  String toString() => '{request: $tag}';
}
