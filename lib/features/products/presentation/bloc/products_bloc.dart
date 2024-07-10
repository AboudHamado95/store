import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/core/usecases/usecases.dart';
import 'package:store_app/features/products/domain/entities/product_entity.dart';
import 'package:store_app/features/products/domain/entities/products_entity.dart'
    as products;
import 'package:store_app/features/products/domain/usecases/filter_products_usecase.dart';
import 'package:store_app/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:store_app/features/products/domain/usecases/get_product_by_id.dart';
import 'package:store_app/features/products/presentation/bloc/success_error/either_success_or_error.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required GetAllProductsUseCase concreteGetAllProductsUseCase,
    required FilterProductsUseCase concreteFilterProductsUseCase,
    required GetProductByIdUseCase concreteGetProductByIdUseCase,
  })  : getAllProductsUseCase = concreteGetAllProductsUseCase,
        filterProductsUseCase = concreteFilterProductsUseCase,
        getProductByIdUseCase = concreteGetProductByIdUseCase,
        super(Empty());

  final GetAllProductsUseCase getAllProductsUseCase;
  final FilterProductsUseCase filterProductsUseCase;
  final GetProductByIdUseCase getProductByIdUseCase;

  products.ProductsEntity productsEntity =
      const products.ProductsEntity(success: false, data: [], message: '');
  products.ProductsEntity filterProductsEntity =
      const products.ProductsEntity(success: false, data: [], message: '');

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is GetAllProductsEvent) {
      yield Loading();
      final failureOrPhysician = await getAllProductsUseCase(NoParams());

      yield* successGetAllProductsOrErrorState(failureOrPhysician);
    }

    if (event is FilterProductsByTitleEvent) {
      yield Loading();
      final failureOrPhysician = await filterProductsUseCase(event.rate);

      yield* successGetAllProductsByFilterOrErrorState(failureOrPhysician);
    }
    if (event is GetProductByIdEvent) {
      yield Loading();
      final failureOrPhysician = await getProductByIdUseCase(event.id);

      yield* successGetProductByIdOrErrorState(failureOrPhysician);
    }

    if (event is ClearEvent) {
      yield Empty();
    }
  }
}
