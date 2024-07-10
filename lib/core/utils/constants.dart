// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

enum SnackBarVideoStates { SUCCESS, ERROR, WARNING }

enum UserType { TENANT, NONTENANT }

enum MediaUpload { CAMERA, GALLERY }

enum OnItemClick { PRIVACYANDPOLICY, TERMSANDCONDITIONS, DELETEACCOUNT, LOGOUT }

List<String> unitTypeList = [
  'Studio',
  'One Bedroom',
  'Two Bedroom',
  'Three Bedroom',
  'Four Bedroom',
  'Villa',
  'Townhouse',
  'Commercial'
];

class Constants {
  // static NotificationMessage? notification;
  static double h(BuildContext context, double height) {
    return MediaQuery.of(context).size.height / height;
  }

  static double w(BuildContext context, double width) {
    return MediaQuery.of(context).size.width / width;
  }

  // static double textHeight = context.screenHeight / 24;

  static IconData chooseIconForSnackBar(SnackBarVideoStates state) {
    IconData? icon;
    switch (state) {
      case SnackBarVideoStates.SUCCESS:
        icon = Icons.done;
        break;
      case SnackBarVideoStates.ERROR:
        icon = Icons.error;
        break;
      case SnackBarVideoStates.WARNING:
        icon = Icons.info;
        break;
      default:
    }
    return icon!;
  }

  static String chooseSubtitleVideo(SnackBarVideoStates state) {
    String? text;
    switch (state) {
      case SnackBarVideoStates.SUCCESS:
        text = 'Video selected successfully!';
        break;
      case SnackBarVideoStates.ERROR:
        text = 'Video size must be less than 10 MB';
        break;
      case SnackBarVideoStates.WARNING:
        text = 'No Video selected.';
        break;
      default:
    }
    return text!;
  }

  static String userTypeMethod(UserType user) {
    String userType;
    switch (user) {
      case UserType.TENANT:
        userType = 'tenant';
        break;
      case UserType.NONTENANT:
        userType = 'non_tenant';
        break;
      default:
        userType = 'something wrong';
    }
    return userType;
  }
}
