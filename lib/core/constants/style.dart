import 'package:flutter/material.dart';

extension EmptyPadding on num{
Widget get vSpace=>SizedBox(height: this.toDouble(),);
Widget get hSpace=>SizedBox(width: this.toDouble(),);  

}
class StoreGlobal{
  /// text scale of device
  double _textScale = 1;

  get textScaleOfDevice => _textScale;

  set textScaleOfDevice(value) => _textScale = value;

  
  Size _size = const Size(350, 500);

  Size get size => _size;

  set size(value) => _size = value;

  bool _isArabic = false;

  bool get isArabic => _isArabic;

  set isArabic(value) => _isArabic = value;

  
  String _locale = 'en';

  String get locale => _locale;

  set locale(value) => _locale = value;

}


class Corners{
  
  static const double btn = s5;
  static const double sm = 10;
  static const double xsm = 5;
  static const double dialog = 12;

  /// Xs
  static const double s3 = 3;

  static BorderRadius get s3Border => BorderRadius.all(s3Radius);

  static Radius get s3Radius => Radius.circular(s3);

  /// Small
  static const double s5 = 5;

  static BorderRadius get s5Border => BorderRadius.all(s5Radius);

  static Radius get s5Radius => Radius.circular(s5);

  /// Medium
  static const double s8 = 8;

  static const BorderRadius s8Border = BorderRadius.all(s8Radius);

  static const Radius s8Radius = Radius.circular(s8);

  /// Large
  static const double s10 = 10;

  static BorderRadius get s10Border => BorderRadius.all(s10Radius);

  static Radius get s10Radius => Radius.circular(s10);
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);
  static const double med = 15;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 20;
  static const double xlg = 25;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);
  static const double xl = 30;
  static const double xll = 40;
  static const double xxl = 60;

}