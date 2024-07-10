import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/core/usecases/usecases.dart';
import 'package:store_app/features/orders/domain/entities/order_entity.dart';
import 'package:store_app/features/orders/domain/usecases/get_all_orders_usecase.dart';
import 'package:store_app/features/orders/presentation/bloc/success_error/either_success_or_error.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrderBloc extends Bloc<OrdersEvent, OrdersState> {
  OrderBloc({
    required GetAllOrderUseCase concreteGetAllOrderUseCase,
  })  : getAllOrderUseCase = concreteGetAllOrderUseCase,
        super(Empty());

  final GetAllOrderUseCase getAllOrderUseCase;

  OrderEntity orderEntity =
      const OrderEntity(success: false, data: [], message: '');

  @override
  Stream<OrdersState> mapEventToState(OrdersEvent event) async* {
    if (event is GetAllOrdersEvent) {
      yield Loading();
      final failureOrPhysician = await getAllOrderUseCase(NoParams());

      yield* successGetAllOrdersOrErrorState(failureOrPhysician);
    }
  }
}
