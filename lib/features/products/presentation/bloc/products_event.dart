part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ClearEvent extends ProductsEvent {
  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductsEvent {
  @override
  List<Object> get props => [];
}

class GetProductByIdEvent extends ProductsEvent {
  final int id;
  const GetProductByIdEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class FilterProductsByTitleEvent extends ProductsEvent {
  final String rate;
  const FilterProductsByTitleEvent({required this.rate});
  @override
  List<Object> get props => [rate];
}
