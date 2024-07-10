import 'package:flutter/foundation.dart';
import 'package:store_app/core/utils/app_exports.dart';
import 'package:store_app/features/auth/data/models/auth_model.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/network_configurations.dart';
import '../../../../core/network/network_interface.dart';
import '../../../../core/network/network_service.dart';
import '../repositories/auth_repository.dart';

class AuthClient {
  NetworkServices networkServices = NetworkServices();
  Future<LoginModel> login({required LoginParam param}) async {
    try {
      final res = await networkServices.post(
        RemoteDataBundle(
          body: {"phone": param.phone, "password": param.password},
          networkPath: NetworkConfigurations.kSignInEndPoint,
          urlParams: <String, String>{},
        ),
      );
      return Future.value(LoginModel.fromJson(res));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      throw AppException(e);
    }
  }
}
