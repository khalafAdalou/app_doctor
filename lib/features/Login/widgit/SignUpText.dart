import 'package:app_doctor/core/theming/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Don't have an account yet? ",
        style: const TextStyle(
          color: ColorsManager.darkBlue,
          fontSize: 15,
        ),
        children: [
          TextSpan(
            text: 'Sign Up',
            recognizer: TapGestureRecognizer()
              ..onTap = () {},
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