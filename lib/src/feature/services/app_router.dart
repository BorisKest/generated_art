import 'package:flutter/material.dart';
import 'package:generated_art/src/feature/widgets/bubbles/painter.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => Painter(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Painter(),
        );
    }
  }
}
