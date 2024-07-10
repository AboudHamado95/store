part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class HomeScreenInitial extends OrdersState {}

class Empty extends OrdersState {
  @override
  List<Object> get props => [];
}

class Loading extends OrdersState {
  @override
  List<Object> get props => [];
}

class Error extends OrdersState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessGetAllOrdersState extends OrdersState {
  final OrderEntity param;
  const SuccessGetAllOrdersState({required this.param});
  @override
  List<Object> get props => [param];
}
