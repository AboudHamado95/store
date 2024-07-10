import 'package:store_app/features/orders/data/datasources/orders_remote_data_functions.dart';
import 'package:store_app/features/orders/data/models/order_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class OrdersRemoteDataSource {
  Future<OrderModel> getAllOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  ApiConsumer client;
  OrdersRemoteDataSourceImpl({required this.client});

  OrdersRemoteDataFunctions functions = OrdersRemoteDataFunctions();

  @override
  Future<OrderModel> getAllOrders() {
    return functions.getAllOrders(EndPoints.getAllOrders);
  }
}
