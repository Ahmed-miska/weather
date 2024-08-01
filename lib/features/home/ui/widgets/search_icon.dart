import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weahter/core/helpers/extensions.dart';
import 'package:weahter/core/routing/routes.dart';
import 'package:weahter/core/theming/colors.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.searchScreen);
        },
        child: Icon(
          Icons.search,
          size: 25.h,
          color: AppColors.white,
        ),
      ),
    );
  }
}
