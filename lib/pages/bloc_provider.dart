import 'package:debestech_course_project/counter_bloc/counter_bloc.dart';
import 'package:debestech_course_project/pages/register/bloc/register_bloc.dart';
import 'package:debestech_course_project/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:debestech_course_project/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          // lazy: false, // lazy false so a yin load load
          create: (context) => CounterBloc(),
        ),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
