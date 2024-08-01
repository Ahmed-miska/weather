import 'package:flutter/material.dart';

import 'package:weahter/core/routing/routes.dart';
import 'package:weahter/features/home/ui/home_screen.dart';
import 'package:weahter/features/search/ui/search_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      default:
        return null;
    }
  }
}
