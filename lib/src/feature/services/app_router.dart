import 'package:flutter/material.dart';
import 'package:generated_art/src/feature/widgets/bubbles/painter.dart';
import 'package:generated_art/src/feature/widgets/other_worldly/ow_main.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => Painter(),
        );
      case '/ow':
        return MaterialPageRoute(
          builder: (_) => OWAnimation(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Painter(),
        );
    }
  }
}
