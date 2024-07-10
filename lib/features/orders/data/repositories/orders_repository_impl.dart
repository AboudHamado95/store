// import 'package:dartz/dartz.dart';
// import 'package:store_app/core/utils/app_strings.dart';
// import 'package:store_app/features/orders/domain/entities/order_entity.dart';
// import 'package:store_app/features/orders/domain/repositories/orders_repository.dart';
// import '../../../../core/errors/failures.dart';
// import '../../../../core/network/network_info.dart';
// import '../datasources/orders_remote_data_source.dart';
// import 'orders_repository_functions.dart';

// class OrdersRepositoryImpl implements OrdersRepository {
//   final NetworkInfo networkInfo;
//   final OrdersRemoteDataSource ordersRemoteDataSource;
//   OrdersRepositoryImpl({
//     required this.networkInfo,
//     required this.ordersRemoteDataSource,
//   });

//   ProductsRepositoryFunctions functions = ProductsRepositoryFunctions();

//   @override
//   Future<Either<Failure, OrderEntity>> getAllOrders() async {
//     if (await networkInfo.isConnected) {
//       return await functions.convertToOrderEntity(() {
//         return ordersRemoteDataSource.getAllOrders();
//       });
//     }
//     return Left(ServerFailure(message: AppStrings.noInternet));
//   }
// }
