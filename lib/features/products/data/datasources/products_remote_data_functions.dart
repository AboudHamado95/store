// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:store_app/features/products/data/models/product_model.dart';
import 'package:store_app/features/products/data/models/products_model.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../core/api/status_code.dart';
import '../../../../../injection.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';

class ProductsRemoteDataFunctions {
  Dio dioConsumer = Dio();
  ProductsRemoteDataFunctions() {
    (dioConsumer.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dioConsumer.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    dioConsumer.options
      ..baseUrl = EndPoints.baseUrl
      ..headers = {
        'content-type': 'application/json',
        'accept': 'application/json'
      }
      ..connectTimeout = const Duration(milliseconds: 60 * 1000)
      ..receiveTimeout = const Duration(milliseconds: 60 * 1000)
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    dioConsumer.interceptors.add(getIt<LogInterceptor>());
  }

  Future<ProductsModel> getAllProducts(String url) async {
    late Response response;
    if (kDebugMode) {
      print(url);
    }

    try {
      response = await dioConsumer.get(url,
          options: Options(headers: {
            'Authorization': 'Bearer ${CacheHelper.getData(key: 'uId')}',
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return productsModelFromJson(response.data);
      }
      return exceptionHandling(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw exceptionHandling(response);
    }
  }

  Future<ProductsModel> filterByRating(String url, String rate) async {
    late Response response;
    if (kDebugMode) {
      print(url);
    }

    try {
      response = await dioConsumer.post(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${CacheHelper.getData(key: 'uId')}',
            },
          ),
          data: {'rate': rate});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return productsModelFromJson(response.data);
      }
      return exceptionHandling(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw exceptionHandling(response);
    }
  }

  Future<ProductModel> getProductById(String url, int id) async {
    late Response response;
    if (kDebugMode) {
      print(url);
    }

    try {
      response = await dioConsumer.get(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${CacheHelper.getData(key: 'uId')}',
            },
          ),
          queryParameters: {'id': id});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return productModelFromJson(response.data);
      }
      return exceptionHandling(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw exceptionHandling(response);
    }
  }
}
