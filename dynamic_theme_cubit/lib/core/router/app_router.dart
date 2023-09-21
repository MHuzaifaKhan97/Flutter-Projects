import 'package:dynamic_theme_cubit/core/router/router_exception.dart';
import 'package:dynamic_theme_cubit/view/home_screen.dart';
import 'package:dynamic_theme_cubit/view/places_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyHomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: "title"),
        );
      case PlacesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const PlacesScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
