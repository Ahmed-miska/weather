import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weahter/core/di/injection.dart';
import 'package:weahter/core/routing/routes.dart';
import 'package:weahter/features/home/logic/weather_cubit.dart';
import 'package:weahter/features/home/ui/home_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<WeatherCubit>(),
            child: const HomeScreen(),
          ),
        );
      
      default:
        return null;
    }
  }
}
