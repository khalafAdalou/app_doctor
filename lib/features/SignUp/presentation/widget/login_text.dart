import 'package:app_doctor/core/theming/colors.dart';
import 'package:app_doctor/features/Login/view/login_Screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Already have an account yet?  ",
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
                    MaterialPageRoute(builder: (c)=>LoginView()
                    )
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
