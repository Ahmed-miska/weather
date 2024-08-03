import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weahter/core/helpers/app_assets.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/core/theming/colors.dart';
import 'package:weahter/core/theming/styles.dart';

class ContainerOfRaneAndHumidityAndWind extends StatelessWidget {
  final int rane;
  final int humidity;
  final double wind;
  const ContainerOfRaneAndHumidityAndWind({
    super.key,
    required this.rane,
    required this.humidity,
    required this.wind,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.mainBlue.withOpacity(.4),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.raneIcon),
          horizontalSpace(10),
          Text('$rane%', style: AppTextStyles.font14whiteBold),
          const Spacer(),
          SvgPicture.asset(AppAssets.humidityconIcon),
          horizontalSpace(10),
          Text('$humidity%', style: AppTextStyles.font14whiteBold),
          const Spacer(),
          SvgPicture.asset(AppAssets.windSpeedIcon),
          horizontalSpace(10),
          Text('$wind Km/h', style: AppTextStyles.font14whiteBold),
        ],
      ),
    );
  }
}
