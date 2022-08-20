import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generated_art/src/feature/widgets/other_worldly/models/ow_models.dart';

class DemoPainter extends CustomPainter {
  double iter;
  List<ColorInfo> colors;

  @override
  void paint(Canvas canvas, Size size) {
    renderDrawing(canvas, size);
  }

  void renderDrawing(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Colors.black87);

    renderStructure2(canvas, size, iter, colors, 9);
  }

  void renderStructure2(
    Canvas canvas,
    Size size,
    double iter,
    List<ColorInfo> colors,
    int totalIter,
  ) {
    for (int j = 0; j < totalIter; j++) {
      double distance = 0.0;
      double tempIter = totalIter - j + iter;

      for (double i = 0; i < 80; i = i + 0.01) {
        canvas.drawCircle(
          Offset(
            (size.width / 2) +
                (distance * cos(distance) * sin(distance) * atan(distance)),
            (size.height / 2) +
                (distance * cos(distance) * sin(distance) * tan(distance)),
          ),
          5.0 - (0.5 * (totalIter - tempIter)),
          Paint()..color = colors[j].color,
        );

        distance = distance + (0.2 + (0.1 * totalIter - tempIter));
      }
    }
  }

  @override
  bool shouldRepaint(DemoPainter oldDelegate) {
    return iter != oldDelegate.iter;
  }

  DemoPainter(this.iter, this.colors);
}
