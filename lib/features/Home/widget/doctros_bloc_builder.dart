import 'package:app_doctor/features/Home/data/cubit/home_cubit.dart';
import 'package:app_doctor/features/Home/data/cubit/home_state.dart';
import 'package:app_doctor/features/Home/data/model/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctors_list_view_item.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsSuccess: (specializationDataList) {
            final List<Doctors> doctorsList = specializationDataList
                ?.specializationDataList
                ?.whereType<SpecializationsData>()
                .expand<Doctors>(
                  (specialization) =>
              specialization.doctorsList?.whereType<Doctors>() ??
                  <Doctors>[],
            )
                .toList() ??
                <Doctors>[];

            debugPrint('Doctors count: ${doctorsList.length}');

            return Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 8.h),
                itemCount: doctorsList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final doctor = doctorsList[index];
                  return DoctorsListViewItem(
                    doctor: doctor,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 4.h);
                },
              ),
            );
          },

          specializationsError: (errorHandler) {
            return const SizedBox.shrink();
          },

          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}

extension on List<Doctors?>? {
  get specializationDataList => null;
}