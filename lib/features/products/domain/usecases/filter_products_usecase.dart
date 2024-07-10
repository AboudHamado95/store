import 'package:dartz/dartz.dart';
import 'package:store_app/features/products/domain/entities/products_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/products_repository.dart';

class FilterProductsUseCase implements UseCase<ProductsEntity, String> {
  final ProductsRepository repository;
  FilterProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductsEntity>> call(String params) async {
    return repository.filterByRating(rate: params);
  }
}
