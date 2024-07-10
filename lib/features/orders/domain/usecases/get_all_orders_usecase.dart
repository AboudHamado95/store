import 'package:dartz/dartz.dart';
import 'package:store_app/features/orders/domain/entities/order_entity.dart';
import 'package:store_app/features/orders/domain/repositories/orders_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';

class GetAllOrderUseCase implements UseCase<OrderEntity, NoParams> {
  final OrdersRepository repository;
  GetAllOrderUseCase({required this.repository});

  @override
  Future<Either<Failure, OrderEntity>> call(NoParams params) async {
    return repository.getAllOrders();
  }
}
