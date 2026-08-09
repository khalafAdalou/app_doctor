import 'package:app_doctor/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class SpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final String title;

  const SpecialityListViewItem({
    super.key,
    required this.itemIndex,
    required this.selectedIndex,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = itemIndex == selectedIndex;

    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: itemIndex == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          Container(
            decoration: isSelected
                ? BoxDecoration(
              border: Border.all(
                color: ColorsManager.darkBlue,
              ),
              shape: BoxShape.circle,
            )
                : null,
            child: CircleAvatar(
              radius: 28.r,
              backgroundColor: ColorsManager.lightBlue,
              child: SvgPicture.asset(
                'assets/svgs/general_speciality.svg',
                height: isSelected ? 42.h : 40.h,
                width: isSelected ? 42.w : 40.w,
              ),
            ),
          ),

          verticalSpace(8),

          Text(
            title,
            style: isSelected
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}