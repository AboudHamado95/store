import 'package:dartz/dartz.dart';
import 'package:store_app/features/products/domain/entities/products_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/products_repository.dart';

class GetAllProductsUseCase implements UseCase<ProductsEntity, NoParams> {
  final ProductsRepository repository;
  GetAllProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductsEntity>> call(NoParams params) async {
    return repository.getAllProducts();
  }
}
