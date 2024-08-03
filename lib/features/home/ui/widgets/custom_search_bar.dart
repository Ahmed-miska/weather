import 'package:flutter/material.dart';
import 'package:weahter/core/theming/colors.dart';
import 'package:weahter/core/theming/styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const CustomSearchBar({
    super.key,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: 'search for a city',
          hintStyle: AppTextStyles.font14GrayBold,
        ),
        //  onChanged: onChanged,
      ),
    );
  }
}
