import 'package:app_doctor/core/di/dependency_injection.dart';
import 'package:app_doctor/core/theming/colors.dart';
import 'package:app_doctor/features/Login/data/cubit/login_cubit.dart';
import 'package:app_doctor/features/Login/view/login_Screen.dart';
import 'package:app_doctor/features/SignUp/data/cubit/signup_cubit.dart';
import 'package:app_doctor/features/SignUp/presentation/view/SignUp_Screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Already have account? ",
        style: const TextStyle(
          color: ColorsManager.darkBlue,
          fontSize: 15,
        ),
        children: [
          TextSpan(
            text: 'Login',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (_) {
                    return BlocProvider<LoginCubit>(
                      create: (_) => getIt<LoginCubit>(),
                      child: const LoginView(),
                    );
                  },
                ),
              );
              },
            style: const TextStyle(
              color: ColorsManager.mainBlue,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}