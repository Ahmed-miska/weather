import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weahter/core/helpers/app_assets.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/core/theming/styles.dart';

class ForcastDay extends StatelessWidget {
  const ForcastDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Monday', style: AppTextStyles.font14whiteBold),
        const Spacer(),
        SvgPicture.asset(AppAssets.raneIcon),
        const Spacer(),
        Text('30°', style: AppTextStyles.font14whiteBold),
        horizontalSpace(10),
        Text('28°', style: AppTextStyles.font14whiteBold),
      ],
    );
  }
}
