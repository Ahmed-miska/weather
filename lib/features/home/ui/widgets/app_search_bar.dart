import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/features/home/logic/weather_cubit.dart';
import 'package:weahter/features/home/ui/widgets/custom_search_bar.dart';
import 'package:weahter/features/home/ui/widgets/location_icon.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSearchBar(
            controller: context.read<WeatherCubit>().searchController,
            suffixIcon: GestureDetector(
              onTap: () {
                context.read<WeatherCubit>().searchController.clear();
              },
              child: const Icon(Icons.clear),
            ),
            prefixIcon: GestureDetector(
              onTap: () {
                if (context.read<WeatherCubit>().searchController.text.isNotEmpty) {
                  context.read<WeatherCubit>().getWeather();
                }
              },
              child: const Icon(Icons.search),
            ),
          ),
        ),
        horizontalSpace(20),
        GestureDetector(
          onTap: () {
            context.read<WeatherCubit>().fetchAndSetLocation();
          },
          child: const LocationIcon(),
        ),
      ],
    );
  }
}
