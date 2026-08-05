import 'package:app_doctor/core/theming/styles.dart';
import 'package:app_doctor/features/onBoarding/data/presentation/widget/doc_logo_and_name.dart';
import 'package:app_doctor/features/onBoarding/data/presentation/widget/doctor_image_and_text.dart';
import 'package:app_doctor/features/onBoarding/data/presentation/widget/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: Column(
                children: [
                  const DocLogoAndName(),
                  SizedBox(height: 30.h),
                  const DoctorImageAndText(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        Text(
                          'Manage & schedule all of your medical appointments easily with Docdoc to get a new experience.',
                          style: TextStyles.font13GrayRegular,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30.h),
                        const GetStartedButton(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
