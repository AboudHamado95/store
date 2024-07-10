import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../errors/exceptions.dart';
import '../errors/failures.dart';

String removePlus(String input) {
  if (input.contains('+')) {
    input = input.replaceAll('+', '');
  }
  return input;
}

String insertPercentageInEmptySpace(String url) {
  final encodedUrl = Uri.encodeFull(url);
  final replacedUrl = encodedUrl.replaceAll(' ', '%');
  return replacedUrl;
}

Future<dynamic> goTo(BuildContext context, WidgetBuilder builder) async {
  var res = await Navigator.push(
    context,
    MaterialPageRoute(builder: builder),
  );
  return res;
}

String getTheFirstChar(String name) {
  if (name == "") {
    return "";
  }
  List<String> names = name.split(" ");
  String firstName = names[0];
  String lastName = names.length > 1 ? names[names.length - 1] : "";
  String initials =
      "${firstName[0]}${lastName.isNotEmpty ? lastName[0] : ""}";

  return initials.toUpperCase();
}

// String? validateEmail(String? value) {
//   String pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regex = new RegExp(pattern);
//   if(value !=null){
//     if (!regex.hasMatch(value))
//       return 'يرجى ادخال بريد الكتروني صحيح مثال (example@gmail.com)';
//     else
//       return null;
//   }else{
//     return null;
//   }
//
// }

String formatDuration(Duration d) {
  var seconds = d.inSeconds;
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  final hours = seconds ~/ Duration.secondsPerHour;
  seconds -= hours * Duration.secondsPerHour;
  final minutes = seconds ~/ Duration.secondsPerMinute;
  seconds -= minutes * Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (days != 0) {
    tokens.add('$days');
  }
  if (tokens.isNotEmpty || hours != 0) {
    tokens.add('$hours');
  }
  if (tokens.isNotEmpty || minutes != 0) {
    tokens.add('$minutes');
  }
  tokens.add('$seconds');

  return tokens.join(':');
}

// String? validatePhoneNumber(String? value) {
//   String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//   RegExp regExp = new RegExp(pattern);
//   if(value!=null){
//     if (value.length == 0) {
//       return 'Phone number is required!';
//     } else if (!regExp.hasMatch(value)) {
//       return 'The number must consist of (10) example (222 222 2222)!';
//     }
//   }else{
//     return null;
//   }
//
//   return null;
// }

showMessage(
    {required String message, required BuildContext context, Color? bgColor}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // AdvanceSnackBar(
    //         message: message,
    //         mode: Mode.BASIC,
    //         bgColor: (bgColor != null) ? bgColor : Colors.red)
    //     .show(context);
  });
}

Future<Either<Failure, T>> convertToEntity<T>(
    Future<T> Function() remoteFunction) async {
  try {
    final remote = await remoteFunction();
    return Right(remote);
  } catch (e) {
    if (e is ServerException) {
      return Left(ServerFailure(message: e.msg));
    }

    if (e is BadRequestException) {
      return Left(BadRequestFailure(message: e.msg));
    }
    if (e is NotFoundException) {
      return Left(UserFoundFailure(message: e.msg));
    }
    if (e is UnAuthorizedException) {
      return Left(UnAuthorizedFailure(message: e.msg));
    }
    if (e is UnAuthorizedException) {
      return Left(UnAuthorizedFailure(message: e.msg));
    }

    if (e is ToManyRequestException) {
      return Left(ToManyRequestFailure(message: e.msg));
    }
    if (e is OTPException) {
      return Left(OTPFailure(message: e.msg));
    }
    if (e is UserAlreadyExistsException) {
      return Left(UserAlreadyExistsFailure(message: e.msg));
    }
    if (e is ForbiddenException) {
      return Left(ForbiddenFailure(message: e.msg));
    }

    return Left(ServerFailure(message: "Error"));
  }
}
