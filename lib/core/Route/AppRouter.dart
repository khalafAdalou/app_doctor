import 'package:app_doctor/core/Route/routes.dart';
import 'package:app_doctor/features/Home/data/cubit/home_cubit.dart';
import 'package:app_doctor/features/Home/view/home_screen.dart';
import 'package:app_doctor/features/Login/data/cubit/login_cubit.dart';
import 'package:app_doctor/features/Login/view/login_Screen.dart';
import 'package:app_doctor/features/SignUp/data/cubit/signup_cubit.dart';
import 'package:app_doctor/features/SignUp/presentation/view/SignUp_Screen.dart';
import 'package:app_doctor/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())
              ..getSpecializations()
              ..getProfile(),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
