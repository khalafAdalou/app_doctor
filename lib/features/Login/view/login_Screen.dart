import 'package:app_doctor/core/helper/extensions.dart';
import 'package:app_doctor/core/theming/colors.dart';
import 'package:app_doctor/features/Login/data/cubit/login_cubit.dart';
import 'package:app_doctor/features/Login/widgit/AuthTextField.dart';
import 'package:app_doctor/features/Login/widgit/LoginButton.dart';
import 'package:app_doctor/features/Login/widgit/LoginHeader.dart';
import 'package:app_doctor/features/Login/widgit/SignUpText.dart';
import 'package:app_doctor/features/Login/widgit/TermsAndConditionsText.dart';
import 'package:app_doctor/features/Login/widgit/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgit/RememberForgotRow.dart' show RememberForgotRow;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool rememberMe = false;

  @override
  void dispose() {
    context.read<LoginCubit>().emailController.dispose();
    context.read<LoginCubit>().passwordController.dispose();
    super.dispose();
  }

  void login() {
    FocusScope.of(context).unfocus();

    final email = context.read<LoginCubit>().emailController.text.trim();
    final password = context.read<LoginCubit>().passwordController.text.trim();

    debugPrint('Email: $email');
    debugPrint('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.moreLightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(),
              verticalSpace(32),
              Form(
                key: context.read<LoginCubit>().formKey,
                child: Column(
                  children: [
                    AuthTextField(
                      controller: context.read<LoginCubit>().emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (String? p1) {
                        if (p1!.isEmpty || p1 == null) {
                          return 'Please enter email';
                        }
                      },
                    ),
                    verticalSpace(18),
                    AuthTextField(
                      controller: context.read<LoginCubit>().passwordController,
                      hintText: 'Password',
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => login(),
                      validator: (String? p1) {
                        if (p1!.isEmpty || p1 == null) {
                          return 'Please enter password';
                        }
                      },
                    ),
                  ],
                ),
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
              LoginButton(onPressed:(){
                checkLogin(context);
              }),

              const SizedBox(height: 36),
              const TermsAndConditionsText(),
              const SizedBox(height: 30),
              const Center(child: SignUpText()),
              const SizedBox(height: 20),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) {
if (context.read<LoginCubit>().formKey.currentState!.validate()) {
  context.read<LoginCubit>().loginFun();
}
// if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    //   context.read<LoginCubit>().loginFun(
    //     LoginRequestBody(
    //       email: context.read<LoginCubit>().emailController.text,
    //       password: context.read<LoginCubit>().passwordController.text,
    //     ),
    //   );
    // }
  }
}
