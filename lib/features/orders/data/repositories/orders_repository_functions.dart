import 'package:dartz/dartz.dart';
import 'package:store_app/features/orders/domain/entities/order_entity.dart';

import '../../../../../core/utils/functions.dart';
import '../../../../core/errors/failures.dart';

typedef ProductsEntityFunction = Future<OrderEntity> Function();

class ProductsRepositoryFunctions {
  Future<Either<Failure, OrderEntity>> convertToOrderEntity(
      ProductsEntityFunction function) async {
    return convertToEntity(function);
  }
}
