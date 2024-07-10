import 'package:flutter/foundation.dart';
import 'package:store_app/core/utils/app_exports.dart';
import 'package:store_app/features/auth/data/models/auth_model.dart';
import 'package:store_app/features/home/data/models/offers_model.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/network_configurations.dart';
import '../../../../core/network/network_interface.dart';
import '../../../../core/network/network_service.dart';

class OffersClient {
  NetworkServices networkServices = NetworkServices();
  Future<OffersModel> getOffers() async {
    try {
      final res = await networkServices.get(
        RemoteDataBundle(
          body: {},
          networkPath: NetworkConfigurations.kOffersEndPoint,
          urlParams: <String, String>{},
        ),
      );
      return Future.value(OffersModel.fromJson(res));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      throw AppException(e);
    }
  }
}
