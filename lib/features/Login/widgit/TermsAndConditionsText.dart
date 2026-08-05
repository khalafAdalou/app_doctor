import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/colors.dart' show ColorsManager;


class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'By logging, you agree to our ',
          style: const TextStyle(
            color: ColorsManager.gray,
            fontSize: 14,
            height: 1.6,
          ),
          children: [
            TextSpan(
              text: 'Terms & Conditions',
              recognizer: TapGestureRecognizer()
                ..onTap = () {},
              style: const TextStyle(
                color: ColorsManager.darkBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const TextSpan(
              text: ' and\n',
            ),
            TextSpan(
              text: 'Privacy Policy.',
              recognizer: TapGestureRecognizer()
                ..onTap = () {},
              style: const TextStyle(
                color: ColorsManager.darkBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}