import 'package:app_doctor/core/theming/colors.dart';
import 'package:app_doctor/core/theming/styles.dart';
import 'package:app_doctor/features/Home/data/cubit/home_cubit.dart';
import 'package:app_doctor/features/Home/data/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return current is ProfileLoading ||
                current is ProfileSuccess ||
                current is ProfileError;
          },
          builder: (context, state) {
            return state.maybeWhen(
              profileLoading: () {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi...'),
                    Text('How Are you Today?'),
                  ],
                );
              },

              profileSuccess: (userData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${userData?.name ?? 'User'}!',
                      style: TextStyles.font18DarkBlueBold,
                    ),
                    Text(
                      'How Are you Today?',
                      style: TextStyles.font12GrayRegular,
                    ),
                  ],
                );
              },

              profileError: (errorHandler) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi!',
                      style: TextStyles.font18DarkBlueBold,
                    ),
                    Text(
                      'How Are you Today?',
                      style: TextStyles.font12GrayRegular,
                    ),
                  ],
                );
              },

              orElse: () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi!',
                      style: TextStyles.font18DarkBlueBold,
                    ),
                    Text(
                      'How Are you Today?',
                      style: TextStyles.font12GrayRegular,
                    ),
                  ],
                );
              },
            );
          },
        ),

        const Spacer(),

        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset(
            'assets/svgs/notifications.svg',
          ),
        ),
      ],
    );
  }
}