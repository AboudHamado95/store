import 'package:equatable/equatable.dart';

import '../../data/models/products_model.dart';

class ProductsEntity extends Equatable {
  final bool success;
  final List<Datum> data;
  final String message;

  const ProductsEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [success, data, message];
}
