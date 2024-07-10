
import 'app_exception.dart';

/// the class returned when ever an
/// api call had an error
/// it maps the app exception and make returns the error
class ErrorModel {
  int? statusCode;
  String? error;
  dynamic data;
  String? phone;
  String? email;
  String? password;
  String? signInMessage;
  String? payemntError;
  ErrorModel(this.error, this.data, this.phone, this.email, this.signInMessage,
      this.password, this.statusCode, this.payemntError);
  ErrorModel.fromException(AppException e) {
    error = 
        e.error ??
        (statusCode != 200 || statusCode != 201
            ? e.data.toString().contains('[')
                ? e.data.toString().split('[').last.split(']').first
                : e.data.toString().split('error:').last.split('}').first
            : e.data);
    data = e.data;
    if (e.data is Map &&
        e.data['email'] != null &&
        e.data['email'] is List &&
        e.data['email'].isNotEmpty) {
      email = e.data['email'][0];
    }
    if (e.data is Map &&
        e.data['password'] != null &&
        e.data['password'] is List &&
        e.data['password'].isNotEmpty) {
      email = e.data['password'][0];
    }

    if (e.data is Map &&
        e.data['phone'] != null &&
        e.data['phone'] is List &&
        e.data['phone'].isNotEmpty) {
      phone = e.data['phone'][0];
    }

    if (e.data is Map && e.data['error'] != null) {
      signInMessage = e.data['error'];
      error = e.data['error'];
    }
    statusCode = e.code;
    // Logger().e(e.code);
    // Logger().e(statusCode);
    if (e.data is Map && e.code == 400) {
      if (e.data['data'] != null) {
        payemntError = e.data['data']['errorDesc'];

        error = e.data['message'];
      }
    }
    if (e.data is Map && e.code == 422) {
      if (e.data != null) {
        payemntError = e.data['message'];
      }
    }
  }
}
