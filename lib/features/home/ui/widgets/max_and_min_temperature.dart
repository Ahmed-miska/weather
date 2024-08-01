import 'package:flutter/material.dart';
import 'package:weahter/core/theming/styles.dart';

class MaxAndMinTemperature extends StatelessWidget {
  const MaxAndMinTemperature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Text('Max:', style: AppTextStyles.font22WhiteBold),
        Text(' 32°', style: AppTextStyles.font22WhiteBold),
        Text('    Min:', style: AppTextStyles.font22WhiteBold),
        Text(' 28°', style: AppTextStyles.font22WhiteBold),
        const Spacer(),
      ],
    );
  }
}
