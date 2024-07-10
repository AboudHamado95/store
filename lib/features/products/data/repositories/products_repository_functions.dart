import 'package:dartz/dartz.dart';
import 'package:store_app/features/products/domain/entities/product_entity.dart';

import '../../../../../core/utils/functions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/products_entity.dart';

typedef ProductsEntityFunction = Future<ProductsEntity> Function();
typedef ProductEntityFunction = Future<ProductEntity> Function();

class ProductsRepositoryFunctions {
  Future<Either<Failure, ProductsEntity>> convertToProductsEntity(
      ProductsEntityFunction function) async {
    return convertToEntity(function);
  }
   Future<Either<Failure, ProductEntity>> convertToProductEntity(
      ProductEntityFunction function) async {
    return convertToEntity(function);
  }
}
