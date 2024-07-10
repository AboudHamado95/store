import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/core/utils/hex_color.dart';

import '../utils/font/font_manager.dart';

class ClinicButton extends StatelessWidget {
  const ClinicButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.borderRadius = 0.0,
      this.icon});
  final String buttonText;
  final double borderRadius;
  final Widget? icon;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(HexColor('00A5BC')),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.px),
                  side: BorderSide(color: HexColor('00A5BC'), width: 1),
                ),
              ),
            ),
            onPressed: onPressed,
            child: SizedBox(
              height: 6.h,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? Container(),
                    Text(
                      buttonText,
                      style: FontManagerStyles.btnText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
