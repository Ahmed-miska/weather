import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/core/theming/colors.dart';
import 'package:weahter/core/theming/styles.dart';
import 'package:weahter/features/home/data/models/weather_response_model.dart';
import 'package:weahter/features/home/ui/widgets/forcast_day.dart';

class ForcastContainer extends StatelessWidget {
  final List<ForCastModel> forCasts;
  const ForcastContainer({
    super.key,
    required this.forCasts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.mainBlue.withOpacity(.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Next Forecast', style: AppTextStyles.font20WhiteBold),
          verticalSpace(20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: forCasts.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: ForcastDay(
                  forCast: forCasts[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
