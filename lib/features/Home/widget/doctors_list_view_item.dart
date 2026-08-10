import 'package:app_doctor/features/Home/data/model/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors doctor;

  const DoctorsListViewItem({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: ColorsManager.lighterGray,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              doctor.photo ?? '',
              width: 100.w,
              height: 120.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  width: 100.w,
                  height: 120.h,
                  child: const Icon(
                    Icons.person,
                    size: 50,
                  ),
                );
              },
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font18DarkBlueBold,
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    doctor.degree ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font12GrayMedium,
                  ),

                  SizedBox(height: 7.h),

                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 15.sp,
                        color: ColorsManager.gray,
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          doctor.phone ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font12GrayMedium,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 7.h),

                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 15.sp,
                        color: ColorsManager.gray,
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          doctor.email ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font12GrayMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}