import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Route/AppRouter.dart';
import 'core/Route/routes.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper/constants.dart';
import 'core/helper/extensions.dart';
import 'core/helper/shared_pref_helper.dart';
import 'features/onboarding/presentation/view/onboarding_screen.dart';


Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  await checkIfLoggedInUser();

  await ScreenUtil.ensureScreenSize();

  runApp(
    DoctorApp(
      appRouter: AppRouter(),
    ),
  );
}

void main() async {
  await bootstrap();
}

Future<void> checkIfLoggedInUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  print('TOKEN = $userToken');

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
    print('USER IS LOGGED IN ✅');
  } else {
    isLoggedInUser = false;
    print('USER IS NOT LOGGED IN ❌');
  }
}


class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
          home: child,
        );
      },

      // child: const OnboardingScreen(),
    );
  }
}
