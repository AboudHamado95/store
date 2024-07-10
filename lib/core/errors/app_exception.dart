/// all the exceptions throught the app
/// it implement the built in exception to
/// throw it when an exception occurs
class AppException implements Exception {
  final _message;
  final _error;
  final int? code;
  String? get message => _message;
  String? get error => _error;
  final data;

  AppException(this.data, [this._message, this.code, this._error]);

  @override
  String toString() {
    return "message$_message | error:$_error $code $data";
  }

  @override
  List<Object?> get props => [_message, data, code, _error];
}

class FetchDataException extends AppException {
  FetchDataException({String? message, data})
      : super(data, message = "Unknown Error");
}

class NoInternetException extends AppException {
  NoInternetException({String? message, data})
      : super(data, message = "No internet connection");
}

class NoItemsException extends AppException {
  NoItemsException({String? message, data}) : super(data, message = "No Items");
}

class BadRequestException extends AppException {
  BadRequestException({String? message, data, int? statusCode})
      : super(data, message = message ?? 'Bad Request', statusCode);
}

class UnauthorisedException extends AppException {
  UnauthorisedException({String? message, data, int? code})
      : super(data, message = 'Unauthorised', code);
}

class UnprocessableContentException extends AppException {
  UnprocessableContentException({String? message, data, int? code})
      : super(data, message = 'Error', code);
}

class NotFoundException extends AppException {
  NotFoundException({String? message, data})
      : super(data, message = message ?? 'NotFound');
}

class InvalidInputException extends AppException {
  InvalidInputException({String? message, data})
      : super(data, message = message ?? 'Invalid Input');
}

class ServerErrorException extends AppException {
  ServerErrorException({String? message, data})
      : super(data, message = 'Server Error');
}

class CacheException extends AppException {
  CacheException({String? message, data}) : super(data, message = 'Cash Error');
}
