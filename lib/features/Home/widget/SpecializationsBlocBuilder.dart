import 'package:app_doctor/features/Home/data/cubit/home_cubit.dart';
import 'package:app_doctor/features/Home/data/cubit/home_state.dart';
import 'package:app_doctor/features/Home/widget/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationsBlocBuilder extends StatefulWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  State<SpecializationsBlocBuilder> createState() =>
      _SpecializationsBlocBuilderState();
}

class _SpecializationsBlocBuilderState
    extends State<SpecializationsBlocBuilder> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () {
            return setupLoading();
          },

          specializationsSuccess: (specializationDataList) {
            final specializationsList =
                specializationDataList.specializationDataList;
            return setupSuccess(specializationsList);

          },

          specializationsError: (errorHandler) => setupError(),

          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
Widget setupSuccess(specializationsList) {
  return SizedBox(
    height: 90.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: specializationsList?.length ?? 0,
      itemBuilder: (context, index) {
        final specialization = specializationsList![index];

        return SpecialityListViewItem(
          itemIndex: index,
          selectedIndex: selectedIndex,
          title: specialization?.name ?? '',
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      },
    ),
  );

}
Widget setupLoading() {
  return SizedBox(
    height: 90.h,
    child: const Center(
      child: CircularProgressIndicator(),
    ),
  );
}


Widget setupError() {
    return const SizedBox.shrink();
  }
}