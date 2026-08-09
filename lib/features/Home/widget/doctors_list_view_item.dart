import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({
    super.key,
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
          // Doctor image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
              width: 100.w,
              height: 120.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('ERROR: $error');
                return const Icon(
                  Icons.error,
                  size: 50,
                );
              },
            ),
          ),

          SizedBox(width: 14.w),

          // Doctor information
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'khalaf',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font18DarkBlueBold,
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    'Computer Engineer',
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
                          '33634066',
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
                          'khalafyd@gmail.com',
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