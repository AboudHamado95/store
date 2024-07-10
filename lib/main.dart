import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/app.dart';
import 'package:store_app/bloc_observer.dart';
import 'package:store_app/injection.dart' as injector;


import 'core/cache/cache_helper.dart';
import 'core/utils/app_colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //? Orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //? change status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteColor,
      statusBarIconBrightness: Brightness.dark));

  //? Initial share preferences
  await CacheHelper.init();

//? Bloc observer
  Bloc.observer = MyBlocObserver();

  //? Initial for get it dependencies
  // await injector.init();

  runApp(const MyApp());
}
