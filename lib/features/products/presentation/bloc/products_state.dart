part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends ProductsState {}

class Empty extends ProductsState {
  @override
  List<Object> get props => [];
}

class Loading extends ProductsState {
  @override
  List<Object> get props => [];
}

class Error extends ProductsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessGetAllProductsState extends ProductsState {
  final products.ProductsEntity param;
  const SuccessGetAllProductsState({required this.param});
  @override
  List<Object> get props => [param];
}

class SuccessGetProductState extends ProductsState {
  final ProductEntity param;
  const SuccessGetProductState({required this.param});
  @override
  List<Object> get props => [param];
}

class SuccessGetAllProductsByTitleState extends ProductsState {
  final products.ProductsEntity param;
  const SuccessGetAllProductsByTitleState({required this.param});
  @override
  List<Object> get props => [param];
}
