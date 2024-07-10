import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/presentation/screens/login_screen.dart';
import 'package:store_app/features/splash/presentation/screens/splash_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../features/bottom_navigation_bar/presentation/cubit/bottom_navigation_cubit.dart';
import '../../features/bottom_navigation_bar/presentation/screen/bottom_navigation_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeScreen = '/home_screen';
  // static const String landingScreen = '/landing_screen';
  // static const String preLoginScreen = '/pre_login_screen';
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/register_screen';
  // static const String selectContactScreen = '/select_contact_screen';
  // static const String chatScreen = '/chat_screen';
  // static const String myLogScreen = '/my_log_screen';
  // static const String profileScreen = '/profile_screen';
  // static const String pickedCategoryScreen = '/picked_category_screen';
  // static const String locationScreen = '/location_screen';
  // static const String newLocationScreen = '/new_location_screen';
  // static const String previousLocationScreen = '/previous_location_screen';
  // static const String anotherLocationTenantScreen =
  //     '/another_location_tenant_screen';
//   registerScreen
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return materialBuilder(widget: const SplashScreen());
      case Routes.loginScreen:
        return materialBuilder(widget: const LoginScreen(), settings: settings);
      case Routes.homeScreen:
        return materialBuilder(
            widget: BlocProvider(
          create: (context) => BottomNavigationCubit(),
          child: const BottomNavigationBarScreen(),
        ));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text(AppStrings.appName)),
      ),
    );
  }
}

MaterialPageRoute materialBuilder(
    {required Widget widget, RouteSettings? settings}) {
  return MaterialPageRoute(builder: (_) => widget, settings: settings);
}
