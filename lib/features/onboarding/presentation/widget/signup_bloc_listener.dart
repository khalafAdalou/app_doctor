import 'package:app_doctor/core/di/dependency_injection.dart';
import 'package:app_doctor/features/Login/data/cubit/login_cubit.dart';
import 'package:app_doctor/features/Login/view/login_Screen.dart';
import 'package:app_doctor/features/SignUp/data/cubit/signup_cubit.dart';
import 'package:app_doctor/features/SignUp/data/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
      current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          signupSuccess: (signupResponse) {
            Navigator.pop(context);
            showSuccessDialog(context);
          },
          signupError: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) {
                      return BlocProvider<LoginCubit>(
                        create: (_) => getIt<LoginCubit>(),
                        child: const LoginView(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}