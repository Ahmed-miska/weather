import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weahter/core/theming/colors.dart';

class LocationIcon extends StatelessWidget {
  const LocationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.mainBlue.withOpacity(.4),
      ),
      child: const Icon(Icons.location_on_outlined, color: AppColors.white),
    );
  }
}
