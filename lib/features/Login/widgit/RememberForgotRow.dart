import 'package:app_doctor/core/theming/colors.dart';
import 'package:flutter/material.dart';


class RememberForgotRow extends StatelessWidget {
  const RememberForgotRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onForgotPressed,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onForgotPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: ColorsManager.mainBlue,
            checkColor: Colors.white,
            side: const BorderSide(
              color: ColorsManager.lightGray,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Remember me',
          style: TextStyle(
            color: ColorsManager.gray,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onForgotPressed,
          style: TextButton.styleFrom(
            foregroundColor: ColorsManager.mainBlue,
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: ColorsManager.mainBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}