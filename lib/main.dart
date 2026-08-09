import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Route/AppRouter.dart';
import 'core/Route/routes.dart';
import 'core/di/dependency_injection.dart';
import 'features/onboarding/presentation/view/onboarding_screen.dart';


Future<void> bootstrap() async {
 // WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  // To fix texts being hidden bug in flutter_screenutil in release mode.
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
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
          home: child,
        );
      },

      child: const OnboardingScreen(),
    );
  }
}
