// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/core/utils/app_exports.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../config/themes/theme_cubit.dart';
import '../../../../config/themes/themes.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/constants/assets_paths.dart';
import '../../../../core/utils/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () async {
      AppStrings.uId = await CacheHelper.getData(key: 'uId');
      if (AppStrings.uId == null) {
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      } else {
        Navigator.pushReplacementNamed(
          context,
          Routes.homeScreen,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                ImgAssets.planetTopImg,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(ImgAssets.planetBottomImg)),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: SizedBox(
                height: 29.h,
                width: 35.w,
                child:
                    SvgPicture.asset(ImgAssets.logoImg, fit: BoxFit.scaleDown),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
