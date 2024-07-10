import 'package:flutter/material.dart';
import 'package:store_app/core/utils/hex_color.dart';

class AppColors {
  static Color lightPrimaryColor = HexColor('#4042E2');
  static Color primaryColor = HexColor('#2E306B');
  static Color secondaryColor = HexColor('#263775');
  static Color darkBlueColor = HexColor('#060633');
  static Color lightBlueGreyColor = HexColor('#2E306B').withOpacity(0.67);
  static Color lightBlueColor = HexColor('#4F52FF').withOpacity(0.17);

  static Color greenColor = HexColor('#39A439');
  static Color lightGreenColor = HexColor('#32C032');
  static Color deepGreenColor = HexColor('##558055').withOpacity(0.37);

  static Color whiteColor = HexColor('#F4F4F4');
  static Color darkWhiteColor = HexColor('#F5F5F5');
  static Color darkGreyColor = HexColor('#626563');
  static Color greyColor = HexColor('#D9D9D9').withOpacity(0.28);

  static Color redColor = HexColor('#D40505');

  static Color scarletColor = HexColor('#2F1A31');
  static Color iconsColor = const Color.fromRGBO(
      121, 121, 121, 1); // Color.fromRGBO(154, 154, 161, 1);

  static MaterialColor customColor(Color hexColor) {
    return MaterialColor(0xFF060633, color);
  }
}

Map<int, Color> color = const {
  50: Color.fromRGBO(46, 48, 107, .1),
  100: Color.fromRGBO(46, 48, 107, .2),
  200: Color.fromRGBO(46, 48, 107, .3),
  300: Color.fromRGBO(46, 48, 107, .4),
  400: Color.fromRGBO(46, 48, 107, .5),
  500: Color.fromRGBO(46, 48, 107, .6),
  600: Color.fromRGBO(46, 48, 107, .7),
  700: Color.fromRGBO(46, 48, 107, .8),
  800: Color.fromRGBO(46, 48, 107, .9),
  900: Color.fromRGBO(46, 48, 107, 1),
};
