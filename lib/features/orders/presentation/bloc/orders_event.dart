part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class ClearEvent extends OrdersEvent {
  @override
  List<Object> get props => [];
}

class GetAllOrdersEvent extends OrdersEvent {
  @override
  List<Object> get props => [];
}
