import 'package:app_doctor/core/helper/extensions.dart';
import 'package:app_doctor/core/theming/colors.dart';
import 'package:app_doctor/features/Login/widgit/AuthTextField.dart';
import 'package:app_doctor/features/Login/widgit/LoginButton.dart';
import 'package:app_doctor/features/Login/widgit/LoginHeader.dart';
import 'package:app_doctor/features/Login/widgit/SignUpText.dart';
import 'package:app_doctor/features/Login/widgit/TermsAndConditionsText.dart';
import 'package:flutter/material.dart';

import '../widgit/LogoStackWidget.dart' show LogoStackWidget;
import '../widgit/RememberForgotRow.dart' show RememberForgotRow;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    FocusScope.of(context).unfocus();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    debugPrint('Email: $email');
    debugPrint('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.moreLightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(),
              verticalSpace(32),
              AuthTextField(
                controller: emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(18),
              AuthTextField(
                controller: passwordController,
                hintText: 'Password',
                isPassword: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => login(),
              ),
              const SizedBox(height: 14),
              RememberForgotRow(
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value ?? false;
                  });
                },
                onForgotPressed: () {},
              ),
              const SizedBox(height: 24),
              LoginButton(
                onPressed: login,
              ),

              const SizedBox(height: 36),
              const TermsAndConditionsText(),
              const SizedBox(height: 30),
              const Center(
                child: SignUpText(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}