import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:store_app/core/cache/cache_helper.dart';
import 'package:store_app/core/constants/shared_preferences_manager/shared_prefernces_helpers.dart';
import 'package:store_app/core/network/network_configurations.dart';
import 'package:store_app/core/utils/app_strings.dart';

import '../errors/app_exception.dart';
import 'network_interface.dart';

/// a singleton class used in each client in this app
/// use to access the the functions uou need to call the api
class NetworkServices implements IRemoteDataSource {
  NetworkServices._internal();

  static final NetworkServices _instance = NetworkServices._internal();

  factory NetworkServices() => _instance;

  static Map<String, String> headers =
      Map<String, String>.from(NetworkConfigurations.BaseHeaders);

  static Future<Map<String, String>> initTokenAndHeaders() async {
    AppStrings.uId = await CacheHelper.getData(key: 'uId');
    headers.clear();
    AppStrings.uId != null
        ? headers.addAll({"Authorization": "Bearer ${AppStrings.uId}" ?? ''})
        : null;
    //  ;
    headers.addAll({"accept": "application/json"});
    headers.addAll({"Accept-Language": "en"});

    return headers;
  }

  _returnResponse(Response response) {
    var responseJson =
        response.data.toString().isEmpty ? null : json.decode(response.data);
    switch (response.statusCode) {
      case 200:
      case 203:
      case 204:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(
            data: responseJson, message: 'Bad request', statusCode: 400);
      case 409:
        throw InvalidInputException(
          message: responseJson["error"]["message"],
          //data: responseJson
        );
      case 401:
      case 403:
        throw UnauthorisedException(
            code: 403, message: responseJson['message'], data: responseJson);
      case 404:
        throw NotFoundException(
            message: responseJson['error'], data: responseJson);
      case 422:
        throw UnprocessableContentException(data: responseJson, code: 422);
      case 500:
        throw ServerErrorException(data: responseJson);
      default:
        throw FetchDataException(
            message: kReleaseMode ? 'Unknown Error' : response.data.toString());
    }
  }

  @override
  Future get(RemoteDataBundle remoteBundle) async {
    try {
      BaseOptions options = BaseOptions(
        connectTimeout: const Duration(milliseconds: 30 * 1000),
        receiveTimeout: const Duration(milliseconds: 30 * 1000),
        sendTimeout: const Duration(milliseconds: 30 * 1000),
      );
      Dio dio = Dio(options);
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
      await initTokenAndHeaders();
      headers.addAll(
          {"Content-Type": "application/json", "content-language": "en"});
      final Response response = await dio.get(
        NetworkConfigurations.baseUrl + remoteBundle.networkPath,
        options: Options(
          headers: headers,
          responseType: ResponseType.plain,
        ),
        queryParameters: remoteBundle.urlParams,
        data: remoteBundle.body,
      );

      return _returnResponse(response);
    } on DioError catch (e) {
      if (e.response == null) throw NoInternetException();
      _returnResponse(e.response!);
    }
  }

  @override
  Future post(RemoteDataBundle remoteBundle,
      {BaseOptions? baseOptions, Map<String, String>? extraHeaders}) async {
    try {
      await initTokenAndHeaders();
      headers.addAll({"Content-Type": "application/json"});
      if (extraHeaders != null) {
        headers.addAll(extraHeaders);
      }
      BaseOptions options = baseOptions ??
          BaseOptions(
            connectTimeout: const Duration(milliseconds: 30 * 1000),
            receiveTimeout: const Duration(milliseconds: 30 * 1000),
            sendTimeout: const Duration(milliseconds: 30 * 1000),
          );
      Dio dio = Dio(options);
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );

      final response = await dio.post(
        NetworkConfigurations.baseUrl + remoteBundle.networkPath,
        data: remoteBundle.body,
        queryParameters: remoteBundle.urlParams,
        options: Options(
          headers: headers,
          responseType: ResponseType.plain,
        ),
      );
      return _returnResponse(response);
    } on DioError catch (e) {
      if (e.response == null) throw NoInternetException();
      _returnResponse(e.response!);
    }
  }
}
