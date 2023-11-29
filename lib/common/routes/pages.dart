//unify BlocProvider and routes and pages

import 'package:debestech_course_project/common/routes/names.dart';
import 'package:debestech_course_project/global.dart';
import 'package:debestech_course_project/pages/application/application_page.dart';
import 'package:debestech_course_project/pages/application/bloc/app_bloc.dart';
import 'package:debestech_course_project/pages/home/bloc/home_page_bloc.dart';
import 'package:debestech_course_project/pages/home/home_page.dart';
import 'package:debestech_course_project/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:debestech_course_project/pages/profile/settings/settings_page.dart';
import 'package:debestech_course_project/pages/register/bloc/register_bloc.dart';
import 'package:debestech_course_project/pages/register/register.dart';
import 'package:debestech_course_project/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:debestech_course_project/pages/sign_in/sign_in.dart';
import 'package:debestech_course_project/pages/welcome/bloc/welcome_bloc.dart';
import 'package:debestech_course_project/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SING_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBloc(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBloc(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBloc(),
          )),
    ];
  }

  // return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click as nevigator object
  static MaterialPageRoute GenerateRouteSetting(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name nothing when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("First LogIn");
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                // builder: (_) => const ApplicationPage(), settings: settings);
                builder: (_) => const ApplicationPage(),
                settings: settings);
          }

          print("Second Login");
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
          // builder: (_) => const ApplicationPage(),
          // settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }

      // print("valid route name ${settings.name}");
      // return MaterialPageRoute(
      //     builder: (_) => result.first.page, settings: settings);
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});
}
