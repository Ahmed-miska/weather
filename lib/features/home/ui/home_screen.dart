import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/core/theming/styles.dart';
import 'package:weahter/features/home/ui/widgets/container_of_rane_humidity_wind.dart';
import 'package:weahter/features/home/ui/widgets/home_weather_icon.dart';
import 'package:weahter/features/home/ui/widgets/max_and_min_temperature.dart';
import 'package:weahter/features/home/ui/widgets/search_icon.dart';
import 'widgets/forcast_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                const SearchIcon(),
                verticalSpace(20),
                Text('London', style: AppTextStyles.font20WhiteBold),
                verticalSpace(20),
                const HomeWeatherIcon(),
                verticalSpace(10),
                Text('30°', style: AppTextStyles.font40WhiteBold),
                const MaxAndMinTemperature(),
                verticalSpace(20),
                const ContainerOfRaneAndHumidityAndWind(),
                verticalSpace(20),
                const ForcastContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
