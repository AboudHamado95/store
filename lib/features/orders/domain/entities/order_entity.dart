import 'package:equatable/equatable.dart';
import 'package:store_app/features/orders/data/models/order_model.dart';

class OrderEntity extends Equatable {
  final bool success;
  final List<Datum> data;
  final String message;

  const OrderEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [success, data, message];
}
