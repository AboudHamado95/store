

import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failures.dart';
import 'package:store_app/core/usecases/usecases.dart';
import 'package:store_app/features/products/domain/entities/product_entity.dart';
import 'package:store_app/features/products/domain/repositories/products_repository.dart';

class GetProductByIdUseCase implements UseCase<ProductEntity, int> {
  final ProductsRepository repository;
  GetProductByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductEntity>> call(int id) async {
    return repository.getProductById(id:id);
  }
}
