import 'package:flutter/material.dart';
import 'package:weahter/core/theming/styles.dart';

class MaxAndMinTemperature extends StatelessWidget {
  final double maxTemperature;
  final double minTemperature;
  const MaxAndMinTemperature({
    super.key,
    required this.maxTemperature,
    required this.minTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Text('Max:', style: AppTextStyles.font22WhiteBold),
        Text(' $maxTemperature°', style: AppTextStyles.font22WhiteBold),
        Text('    Min:', style: AppTextStyles.font22WhiteBold),
        Text(' $minTemperature°', style: AppTextStyles.font22WhiteBold),
        const Spacer(),
      ],
    );
  }
}
