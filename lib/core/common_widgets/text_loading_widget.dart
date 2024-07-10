import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TextLoadingWidget extends StatelessWidget {
  const TextLoadingWidget(
      {Key? key, required this.fontSize, required this.charsNumber,this.width = 100})
      : super(key: key);
  final double fontSize;
  final int charsNumber;
  final double width;

  @override
  Widget build(BuildContext context) {
    String text = "";
    for (int i = 0; i < charsNumber; i++) {
      text += "*";
    }

    return Shimmer.fromColors(
      baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      highlightColor: const Color.fromRGBO(119, 118, 118, 0.5490196078431373),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        width: width,
        child: Text(
          text,
          style: latoMediumTextStyle(fontSize: fontSize, context: context),
        ),
      ),
    );
  }
}

TextStyle latoMediumTextStyle(
    {required double fontSize,
    required BuildContext context,
    Color? color,
    double? height,
    TextDecoration? decoration}) {
  return TextStyle(
      color: (color != null)
          ? color
          : Theme.of(context).canvasColor, //Colors.black,
      fontSize: fontSize,
      height: (height != null) ? height : 0,
      decoration: decoration,
      fontFamily: "LatoMedium");
}
