import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: 150.h,
      child: SvgPicture.asset('assets/svgs/test.svg'),
    );
  }
}
