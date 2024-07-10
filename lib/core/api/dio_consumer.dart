// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../injection.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';
import 'status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({
    required this.client,
  }) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
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
    client.interceptors.add(getIt<AppInterceptors>());
    client.interceptors.add(getIt<LogInterceptor>());
  }
  @override
  Future get(String path,
      {Options? options, Map<String, dynamic>? queryParameters}) async {
    final response = await client.get(path,
        options: options, queryParameters: queryParameters);
    return _handleResponseAsJson(response);
  }

  @override
  Future post(String path,
      {Options? options,
      bool? formDataIsEnabled = false,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(Uri.encodeFull(path),
          options: options,
          data: formDataIsEnabled! ? FormData.fromMap(body!) : body,
          queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Options? options,
      bool? formDataIsEnabled,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.put(path,
          data: body, options: options, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future delete(String path, {Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioError error) {}
}
