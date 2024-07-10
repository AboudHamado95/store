import 'package:dartz/dartz.dart';
import 'package:store_app/features/products/domain/entities/product_entity.dart';
import 'package:store_app/features/products/domain/entities/products_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class ProductsRepository {
  Future<Either<Failure, ProductsEntity>> getAllProducts();
  Future<Either<Failure, ProductEntity>> getProductById({required int id});
  Future<Either<Failure, ProductsEntity>> filterByRating(
      {required String rate});
}
