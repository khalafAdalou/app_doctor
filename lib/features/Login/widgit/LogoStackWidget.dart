import 'package:app_doctor/core/theming/colors.dart' show ColorsManager;
import 'package:flutter/material.dart';


class LogoStackWidget extends StatelessWidget {
  const LogoStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 105,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 25,
            child: _LogoCircle(
              text: 'S',
              color: ColorsManager.mainBlue,
            ),
          ),
          Positioned(
            top: 52,
            right: 22,
            child: _LogoCircle(
              text: 'A',
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoCircle extends StatelessWidget {
  const _LogoCircle({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ColorsManager.darkBlue.withValues(
              alpha: 0.25,
            ),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}