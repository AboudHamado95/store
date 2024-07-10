// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:store_app/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:store_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:store_app/injection.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'config/themes/theme_cubit.dart';
import 'core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: ResponsiveSizer(builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThemeCubit()..getCurrentTheme(),
            ),
            BlocProvider(
              create: (context) => HomeBloc(),
            ),
          ],
          child: GetMaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            initialRoute: Routes.initialRoute,
            onGenerateRoute: AppRoute.onGenerateRoute,
          ),
        );
      }),
    );
  }
}
