import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weahter/core/helpers/spacing.dart';
import 'package:weahter/features/home/logic/weather_cubit.dart';
import 'package:weahter/features/home/ui/widgets/app_search_bar.dart';
import 'package:weahter/features/home/ui/widgets/home_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: context.read<WeatherCubit>().bgColor,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.read<WeatherCubit>().bgColor.withOpacity(.2),
                    context.read<WeatherCubit>().bgColor.withOpacity(.4),
                    context.read<WeatherCubit>().bgColor.withOpacity(.6),
                    context.read<WeatherCubit>().bgColor.withOpacity(.8),
                    context.read<WeatherCubit>().bgColor,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                      child: Column(
                        children: [
                          const AppSearchBar(),
                          verticalSpace(20),
                          const HomeBuilder(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
