import 'package:dartz/dartz.dart';
import 'package:store_app/features/orders/domain/entities/order_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class OrdersRepository {
  Future<Either<Failure, OrderEntity>> getAllOrders();
}
