import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/order_entity.dart';
import '../orders_bloc.dart';

Stream<OrdersState> successGetAllOrdersOrErrorState(
  Either<Failure, OrderEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (params) => SuccessGetAllOrdersState(param: params),
  );
}
