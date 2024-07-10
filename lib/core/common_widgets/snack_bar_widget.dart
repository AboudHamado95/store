import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

void getSnackBarMethod(
    {required String title,
    required String message,
    required IconData icon,
    required Color colorIcon,
    required Color backgroundColor}) {
  if (kDebugMode) {
    print('======get snack bar:$message======');
  }

  Get.snackbar(
    title,
    message,
    icon: Icon(icon, color: colorIcon),
    snackPosition: SnackPosition.TOP,
    borderRadius: 20.px,
    margin: EdgeInsets.all(15.px),
    isDismissible: true,
    backgroundColor: backgroundColor,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
