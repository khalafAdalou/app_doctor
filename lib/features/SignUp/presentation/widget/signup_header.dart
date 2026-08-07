import 'package:app_doctor/core/theming/colors.dart';
import 'package:flutter/material.dart';
class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: TextStyle(
            color: ColorsManager.mainBlue,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
          style: TextStyle(
            color: ColorsManager.gray,
            fontSize: 16,
            height: 1.7,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
