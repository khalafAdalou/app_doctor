import 'package:app_doctor/core/theming/colors.dart';
import 'package:flutter/material.dart';


class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: TextStyle(
            color: ColorsManager.mainBlue,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "We're excited to have you back, can't wait to "
          "see what you've been up to since you last logged in.",
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