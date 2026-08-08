import 'package:app_doctor/core/helper/app_regex.dart';
import 'package:app_doctor/core/helper/extensions.dart';
import 'package:app_doctor/core/theming/colors.dart';
import 'package:app_doctor/features/Login/widgit/AuthTextField.dart';
import 'package:app_doctor/features/Login/widgit/SignUpText.dart';
import 'package:app_doctor/features/Login/widgit/TermsAndConditionsText.dart';
import 'package:app_doctor/features/SignUp/data/cubit/signup_cubit.dart';
import 'package:app_doctor/features/SignUp/presentation/widget/login_text.dart';
import 'package:app_doctor/features/SignUp/presentation/widget/signup_button.dart';
import 'package:app_doctor/features/SignUp/presentation/widget/signup_header.dart';
import 'package:app_doctor/features/onboarding/presentation/widget/signup_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void dispose() {
    context.read<SignupCubit>().nameController.dispose();
    context.read<SignupCubit>().emailController.dispose();
    context.read<SignupCubit>().passwordController.dispose();
    context.read<SignupCubit>().phoneController.dispose();
    context.read<SignupCubit>().passwordConfirmationController.dispose();

    super.dispose();
  }

  void login() {
    FocusScope.of(context).unfocus();

    final email = context.read<SignupCubit>().emailController.text.trim();
    final password = context.read<SignupCubit>().passwordController.text.trim();
    final name = context.read<SignupCubit>().nameController.text.trim();
    final phone = context.read<SignupCubit>().phoneController.text.trim();
    final confirmPassword = context
        .read<SignupCubit>()
        .passwordConfirmationController
        .text
        .trim();

    debugPrint('Email: $email');
    debugPrint('Password: $password');
    debugPrint('Email: $name');
    debugPrint('Password: $phone');
    debugPrint('Password: $confirmPassword');
  }

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
              SignupHeader(),
              verticalSpace(32),
              Form(
                key: context.read<SignupCubit>().formKey,
                child: Column(
                  children: [
                    AuthTextField(
                      controller: context.read<SignupCubit>().nameController,
                      hintText: 'Name',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (String? p1) {
                        if (p1!.isEmpty || p1 == null) {
                          return 'Please enter name';
                        }
                      },
                    ),
                    verticalSpace(18),
                    AuthTextField(
                      controller: context.read<SignupCubit>().emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        final email = value?.trim() ?? '';

                        if (email.isEmpty) {
                          return 'Please enter email';
                        }

                        if (!AppRegex.isEmailValid(email)) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                    ),
                    verticalSpace(18),
                    AuthTextField(
                      controller: context
                          .read<SignupCubit>()
                          .passwordController,
                      hintText: 'Password',
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => validateThenDoSignup(context),
                        validator: (value) {
                          final password = value ?? '';

                          if (password.isEmpty) {
                            return 'Please enter password';
                          }

                          if (!AppRegex.isPasswordValid(password)) {
                            return 'Please enter a valid password';
                          }

                          return null;
                        },
                    ),
                    verticalSpace(18),
                    AuthTextField(
                      controller: context
                          .read<SignupCubit>()
                          .passwordConfirmationController,
                      hintText: 'confirm password',
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => validateThenDoSignup(context),
                      validator: (value) {
                        final password = value ?? '';

                        if (password.isEmpty) {
                          return 'Please enter password';
                        }

                        if (!AppRegex.isPasswordValid(password)) {
                          return 'Please enter a valid password';
                        }

                        return null;
                      },
                    ),
                    verticalSpace(18),
                    AuthTextField(
                      controller: context.read<SignupCubit>().phoneController,
                      hintText: 'Phone',
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => login(),
                      validator: (value) {
                        final phone = value ?? '';

                        if (phone!.isEmpty || phone == null) {
                          return 'Please enter phone';
                        }
                        if (!AppRegex.isPhoneNumberValid(phone)) {
                          return 'Please enter a valid phone';
                        }
                      },
                    ),
                  ],
                ),
              ),
              verticalSpace(18),

              SignupButton(
                onPressed: () {
                  validateThenDoSignup(context);
                },
              ),
              const SizedBox(height: 36),
              const TermsAndConditionsText(),
              const SizedBox(height: 30),
              const Center(child: SignUpText()),
              const SizedBox(height: 20),
              SignupBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    // if (context.read<SignupCubit>().formKey.currentState!.validate()) {
    //   context.read<SignupCubit>().emitSignupStates();
    // }
    FocusScope.of(context).unfocus();

    final cubit = context.read<SignupCubit>();

    if (cubit.formKey.currentState?.validate() ?? false) {
      cubit.emitSignupStates();
    }
  }
}
