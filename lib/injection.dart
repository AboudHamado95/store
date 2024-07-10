import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/features/auth/data/datasources/auth_client.dart';
import 'package:store_app/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:store_app/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:store_app/features/orders/domain/repositories/orders_repository.dart';
import 'package:store_app/features/orders/domain/usecases/get_all_orders_usecase.dart';
import 'package:store_app/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:store_app/features/products/data/datasources/products_remote_data_source.dart';
import 'package:store_app/features/products/data/repositories/products_repository_impl.dart';
import 'package:store_app/features/products/domain/repositories/products_repository.dart';
import 'package:store_app/features/products/domain/usecases/filter_products_usecase.dart';
import 'package:store_app/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:store_app/features/products/domain/usecases/get_product_by_id.dart';
import 'package:store_app/features/products/presentation/bloc/products_bloc.dart';

import 'core/api/api_consumer.dart';
import 'core/api/api_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

Future init() async {
  // Features
  // Blocs

  // //? Authentication Bloc
  getIt.registerFactory(() => AuthBloc());

  // //? Products Bloc
  // getIt.registerFactory(() => ProductsBloc(
  //       concreteGetAllProductsUseCase: getIt(),
  //       concreteFilterProductsUseCase: getIt(),
  //       concreteGetProductByIdUseCase: getIt(),
  //     ));

  // //? Orders Bloc
  // getIt.registerFactory(() => OrderBloc(
  //       concreteGetAllOrderUseCase: getIt(),
  //     ));

  // Use Cases

  // // //? Authentication UseCases
  // getIt.registerLazySingleton(() => RegisterUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => LoginUseCase(repository: getIt()));

  // //? Products UseCases
  // getIt.registerLazySingleton(() => GetAllProductsUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => FilterProductsUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => GetProductByIdUseCase(repository: getIt()));

  // //? Orders UseCases
  // getIt.registerLazySingleton(() => GetAllOrderUseCase(repository: getIt()));

  // //? User UseCases
  // getIt.registerLazySingleton(
  //     () => GetTenantUserDataUseCase(repository: getIt()));
  // getIt.registerLazySingleton(
  //     () => GetNonTenantUserDataUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => LogoutUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => DeleteUserUseCase(repository: getIt()));

  // //? Setting
  // getIt.registerLazySingleton(() => GetContactInfoUseCase(repository: getIt()));

  // getIt.registerLazySingleton(
  //     () => GetUserAddressesUseCase(repository: getIt()));

  // getIt.registerLazySingleton(
  //     () => InitialFcmNotificationUseCase(repository: getIt()));
  // getIt.registerLazySingleton(
  //     () => RequestNotificationPermissionUseCase(repository: getIt()));
  // getIt.registerLazySingleton(() => GetFcmTokenUseCase(repository: getIt()));
  // getIt
  //     .registerLazySingleton(() => SendDeviceTokenUseCase(repository: getIt()));
  // getIt.registerLazySingleton(
  //     () => CancelLocalNotificationUseCase(repository: getIt()));
  // getIt.registerLazySingleton(
  //     () => CreateNotificationChannelUsecase(repository: getIt()));
  // getIt.registerLazySingleton(
  //     () => FirebaseMessagingBackgroundUsecase(repository: getIt()));
  // getIt.registerLazySingleton(
  //     () => SetupInteractMessageUseCase(repository: getIt()));

  // Repository

  //? Authentication Repository
  getIt.registerLazySingleton(() => AuthRepository());

  // //? Chats Repository
  // getIt.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
  //       chatRemoteDataSource: getIt(),
  //       networkInfo: getIt(),
  //     ));

  // //? User Repository
  // getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
  //       networkInfo: getIt(),
  //       userRemoteDataSource: getIt(),
  //     ));

  // Data Sources
  getIt.registerLazySingleton(() => AuthClient());
  //? Authentication Data Sources

  // //? User Data Sources
  // getIt.registerLazySingleton<UserRemoteDataSource>(
  //     () => UserRemoteDataSourceImpl(apiConsumer: getIt()));

  // //? Complaint Data Sources
  // getIt.registerLazySingleton<ComplaintRemoteDataSource>(
  //     () => ComplaintRemoteDataSourceImpl(apiConsumer: getIt()));

  // //? Location Data Sources
  // getIt.registerLazySingleton<LocationRemoteDataSource>(
  //     () => LocationRemoteDataSourceImpl(apiConsumer: getIt()));

  // //? Log Data Sources
  // getIt.registerLazySingleton<LogRemoteDataSource>(
  //     () => LogRemoteDataSourceImpl(apiConsumer: getIt()));

  // //? Notification Data Sources

  // getIt.registerLazySingleton<NotificationRemoteDataSource>(
  //     () => NotificationRemoteDataSourceImpl(
  //           apiConsumer: getIt(),
  //           firebaseMessaging: getIt(),
  //         ));

  // //? Chat Data Sources
  // getIt.registerLazySingleton<ChatRemoteDataSource>(
  //     () => ChatRemoteDataSourceImpl(apiConsumer: getIt()));

  // /// Core

  // getIt.registerLazySingleton<NetworkInfo>(
  //     () => NetworkInfoImpl(connectionChecker: getIt()));

  // getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));

  // //? Setting Data sources
  // getIt.registerLazySingleton<SettingRemoteDataSource>(
  //     () => SettingRemoteDataSourceImpl(client: getIt()));

  /// Core

  getIt.registerLazySingleton(() => AuthClient());

  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));

  /// External

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => sharedPreferences);

  getIt.registerLazySingleton(() => AppInterceptors());

  getIt.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));

  getIt.registerLazySingleton(() => http.Client());

  getIt.registerLazySingleton(() => InternetConnectionChecker());

  getIt.registerLazySingleton(() => Dio());
}
