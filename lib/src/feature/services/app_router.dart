import 'package:flutter/material.dart';
import 'package:generated_art/src/feature/widgets/bubbles/painter.dart';
import 'package:generated_art/src/feature/widgets/joy_division_lines/jd_lines.dart';
import 'package:generated_art/src/feature/widgets/other_worldly/ow_main.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/lines':
        return MaterialPageRoute(
          builder: (_) => const Painter(),
        );
      case '/ow':
        return MaterialPageRoute(
          builder: (_) => const OWAnimation(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const JdLines(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Painter(),
        );
    }
  }
}
