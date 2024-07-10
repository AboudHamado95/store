import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(String path,
      {Options? options, Map<String, dynamic>? queryParameters});

  Future<dynamic> post(String path,
      {Options? options,
      bool? formDataIsEnabled,
      Map<String, dynamic>? body,
      Map<String, dynamic> queryParameters});

  Future<dynamic> put(String path,
      {Options? options,
      bool? formDataIsEnabled,
      Map<String, dynamic>? body,
      Map<String, dynamic> queryParameters});

  Future<dynamic> delete(String path, {Map<String, dynamic> queryParameters});
}
