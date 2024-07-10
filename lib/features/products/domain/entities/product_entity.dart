import 'package:equatable/equatable.dart';
import 'package:store_app/features/products/data/models/product_model.dart';

class ProductEntity extends Equatable {
  final bool success;
  final Data data;
  final String message;

  const ProductEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [success, data, message];
}
