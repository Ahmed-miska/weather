import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weahter/core/helpers/app_assets.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/core/theming/colors.dart';
import 'package:weahter/core/theming/styles.dart';

class ContainerOfRaneAndHumidityAndWind extends StatelessWidget {
  const ContainerOfRaneAndHumidityAndWind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.mainBlue,
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.raneIcon),
          horizontalSpace(10),
          Text('6%', style: AppTextStyles.font14whiteBold),
          const Spacer(),
          SvgPicture.asset(AppAssets.humidityconIcon),
          horizontalSpace(10),
          Text('70%', style: AppTextStyles.font14whiteBold),
          const Spacer(),
          SvgPicture.asset(AppAssets.windSpeedIcon),
          horizontalSpace(10),
          Text('10km/h', style: AppTextStyles.font14whiteBold),
        ],
      ),
    );
  }
}
