import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JdPainter extends CustomPainter {
  double iter;
  double step = 10;
  var lines = [];
  var size = window.innerWidth;

  JdPainter(this.iter);

  @override
  void paint(Canvas canvas, Size size) {
    renderDrawing(canvas, size);
  }

  void renderDrawing(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Colors.white);
    createLines(canvas);
  }

  void createLines(Canvas canvas) {
    var point;
    for (double i = step; i <= size! - step; i += step) {
      var line = [];
      for (double j = step; j <= size! - step; j += step) {
        var point = Point(j, i);
        canvas.drawLine(
            Offset.zero, Offset(100, 12), Paint()..color = Colors.black);
      }
      lines.add(line);
    }
  }

  @override
  bool shouldRepaint(JdPainter oldDelegate) {
    return iter != oldDelegate.iter;
  }
}
