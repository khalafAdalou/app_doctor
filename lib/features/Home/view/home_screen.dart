import 'package:app_doctor/core/helper/extensions.dart';
import 'package:app_doctor/features/Home/widget/doctors_blue_container.dart';
import 'package:app_doctor/features/Home/widget/doctors_list_view_item.dart';
import 'package:app_doctor/features/Home/widget/doctors_speciality_see_all.dart';
import 'package:app_doctor/features/Home/widget/home_top_bar.dart';
import 'package:app_doctor/features/Home/widget/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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

              SizedBox(
                height: 90.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SpecialityListViewItem(
                      itemIndex: index,
                      selectedIndex: 0, title: 'index',
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 8.h),
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const DoctorsListViewItem();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 4.h);
                  },
                ),
              ),

              // const SpecializationsBlocBuilder(),
              // verticalSpace(8),
              // const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}