import 'package:flutter/material.dart';

import '../screen/health_screen.dart';
import '../screen/splash_screen.dart';

class RouteConfig {
  static const ROUTE_SPLASH = "/splash";
  static const ROUTE_HOME = "/home";
  static const ROUTE_SHOW_ALL = "/show_all";
  static const ROUTE_MOVIE_DETAIL = "/movie_detail";
  static const ROUTE_SEARCH = "/search";
  static const ROUTE_FAVORITE = "/favorite_movie";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => const HealthScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }

  }
}
