import 'package:store_app/features/products/data/datasources/products_remote_data_functions.dart';
import 'package:store_app/features/products/data/models/product_model.dart';
import 'package:store_app/features/products/data/models/products_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsModel> getAllProducts();
  Future<ProductModel> getProductById({required int id});
  Future<ProductsModel> filterByRating({required String rate});
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  ApiConsumer client;
  ProductsRemoteDataSourceImpl({required this.client});

  ProductsRemoteDataFunctions functions = ProductsRemoteDataFunctions();

  @override
  Future<ProductsModel> getAllProducts() {
    return functions.getAllProducts(EndPoints.getAllProducts);
  }

  @override
  Future<ProductsModel> filterByRating({required String rate}) {
    return functions.filterByRating(EndPoints.filterByRating, rate);
  }

  @override
  Future<ProductModel> getProductById({required int id}) {
    return functions.getProductById(EndPoints.getProductById, id);
  }
}
