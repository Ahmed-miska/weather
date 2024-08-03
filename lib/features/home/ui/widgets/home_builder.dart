import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weahter/core/helpers/app_assets.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/core/theming/styles.dart';
import 'package:weahter/features/home/logic/weather_cubit.dart';
import 'package:weahter/features/home/ui/widgets/container_of_rane_humidity_wind.dart';
import 'package:weahter/features/home/ui/widgets/forcast_container.dart';
import 'package:weahter/features/home/ui/widgets/max_and_min_temperature.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          final weather = state.weatherResponse;
          return Column(
            children: [
              verticalSpace(20),
              Text(weather.city, style: AppTextStyles.font20WhiteBold, textAlign: TextAlign.center),
              verticalSpace(20),
              verticalSpace(20),
              CachedNetworkImage(imageUrl: weather.forCast[0].weatherIcon!),
              Text(weather.forCast[0].weatherDescription, style: AppTextStyles.font20WhiteBold),
              verticalSpace(10),
              Text('${weather.forCast[0].tempC.toString()}° C', style: AppTextStyles.font40WhiteBold),
              verticalSpace(20),
              MaxAndMinTemperature(
                maxTemperature: weather.forCast[0].maxTempC,
                minTemperature: weather.forCast[0].minTempC,
              ),
              verticalSpace(20),
              ContainerOfRaneAndHumidityAndWind(
                rane: weather.forCast[0].rane,
                humidity: weather.forCast[0].humidity,
                wind: weather.forCast[0].windSpeed,
              ),
              verticalSpace(20),
              ForcastContainer(forCasts: weather.forCast)
            ],
          );
        } else if (state is WeatherError) {
          return Center(
            child: Text(
              state.message,
              style: AppTextStyles.font20WhiteBold,
            ),
          );
        }
        return Column(
          children: [
            SvgPicture.asset(AppAssets.searchSvg),
            Text(
              'Please Search For A City ',
              style: AppTextStyles.font20WhiteBold,
            ),
          ],
        );
      },
    );
  }
}
