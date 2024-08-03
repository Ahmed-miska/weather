import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/core/theming/styles.dart';
import 'package:weahter/features/home/data/models/weather_response_model.dart';

class ForcastDay extends StatelessWidget {
  final ForCastModel forCast;
  const ForcastDay({
    super.key,
    required this.forCast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(forCast.date, style: AppTextStyles.font14whiteBold),
        horizontalSpace(20),
        SizedBox(
          height: 30.h,
          child: CachedNetworkImage(imageUrl: forCast.weatherIcon!),
        ),
        horizontalSpace(5),
        Expanded(
            child: Text(
          forCast.weatherDescription,
          style: AppTextStyles.font14whiteBold,
          maxLines: 1,
        )),
        horizontalSpace(10),
        Text('${forCast.maxTempC}°', style: AppTextStyles.font14whiteBold),
        horizontalSpace(10),
        Text('${forCast.minTempC}°', style: AppTextStyles.font14whiteBold),
      ],
    );
  }
}
