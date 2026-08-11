import 'package:app_doctor/core/helper/extensions.dart';
import 'package:app_doctor/features/Home/widget/specialization/SpecializationsBlocBuilder.dart';
import 'package:app_doctor/features/Home/widget/doctors_blue_container.dart';
import 'package:app_doctor/features/Home/widget/doctorUI/doctors_list_view_item.dart';
import 'package:app_doctor/features/Home/widget/specialization/doctors_speciality_see_all.dart';
import 'package:app_doctor/features/Home/widget/doctorUI/doctros_bloc_builder.dart';
import 'package:app_doctor/features/Home/widget/home_top_bar.dart';
import 'package:app_doctor/features/Home/widget/specialization/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              20.0,
              16.0,
              20.0,
              28.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTopBar(),
                const DoctorsBlueContainer(),
                verticalSpace(24),
                const DoctorsSpecialitySeeAll(),
                verticalSpace(18),
                const SpecializationsBlocBuilder(),
                verticalSpace(8),
                const DoctorsBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}