import 'package:dartz/dartz.dart';
import 'package:store_app/features/products/domain/entities/product_entity.dart';
import 'package:store_app/features/products/domain/entities/products_entity.dart';
import 'package:store_app/features/products/presentation/bloc/products_bloc.dart';
import '../../../../../core/errors/failures.dart';

Stream<ProductsState> successGetAllProductsOrErrorState(
  Either<Failure, ProductsEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (params) => SuccessGetAllProductsState(param: params),
  );
}

Stream<ProductsState> successGetAllProductsByFilterOrErrorState(
  Either<Failure, ProductsEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (params) => SuccessGetAllProductsByTitleState(param: params),
  );
}

Stream<ProductsState> successGetProductByIdOrErrorState(
  Either<Failure, ProductEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (params) => SuccessGetProductState(param: params),
  );
}
