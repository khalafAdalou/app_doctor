import 'package:app_doctor/core/di/dependency_injection.dart';
import 'package:app_doctor/core/theming/colors.dart';
import 'package:app_doctor/core/theming/styles.dart';
import 'package:app_doctor/features/Login/data/cubit/login_cubit.dart';
import 'package:app_doctor/features/Login/view/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) {
              return BlocProvider<LoginCubit>(
                create: (_) => getIt<LoginCubit>(),
                child: const LoginView(),
              );
            },
          ),
        );       // context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 52),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteMedium,
      ),
    );
  }
}
