// import 'package:dartz/dartz.dart';
// import 'package:store_app/core/utils/app_strings.dart';
// import 'package:store_app/features/products/domain/entities/product_entity.dart';
// import 'package:store_app/features/products/domain/entities/products_entity.dart';
// import 'package:store_app/features/products/domain/repositories/products_repository.dart';
// import '../../../../core/errors/failures.dart';
// import '../../../../core/network/network_info.dart';
// import '../datasources/products_remote_data_source.dart';
// import 'products_repository_functions.dart';

// class ProductsRepositoryImpl implements ProductsRepository {
//   // final NetworkInfo networkInfo;
//   final ProductsRemoteDataSource productsRemoteDataSource;
//   ProductsRepositoryImpl({
//     required this.networkInfo,
//     required this.productsRemoteDataSource,
//   });

//   ProductsRepositoryFunctions functions = ProductsRepositoryFunctions();

//   @override
//   Future<Either<Failure, ProductsEntity>> getAllProducts() async {
//     if (await networkInfo.isConnected) {
//       return await functions.convertToProductsEntity(() {
//         return productsRemoteDataSource.getAllProducts();
//       });
//     }
//     return Left(ServerFailure(message: AppStrings.noInternet));
//   }

//   @override
//   Future<Either<Failure, ProductsEntity>> filterByRating(
//       {required String rate}) async {
//     if (await networkInfo.isConnected) {
//       return await functions.convertToProductsEntity(() {
//         return productsRemoteDataSource.filterByRating(rate: rate);
//       });
//     }
//     return Left(ServerFailure(message: AppStrings.noInternet));
//   }

//   @override
//   Future<Either<Failure, ProductEntity>> getProductById(
//       {required int id}) async {
//     if (await networkInfo.isConnected) {
//       return await functions.convertToProductEntity(() {
//         return productsRemoteDataSource.getProductById(id: id);
//       });
//     }
//     return Left(ServerFailure(message: AppStrings.noInternet));
//   }
// }
