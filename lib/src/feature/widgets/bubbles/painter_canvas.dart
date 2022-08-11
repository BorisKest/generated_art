import 'dart:math';

import 'package:flutter/material.dart';
import 'package:generated_art/src/feature/widgets/bubbles/particle.dart';

Offset PolarToCartesian(double speed, double theta) {
  return Offset(speed * cos(theta), speed * sin(theta));
}

Color getRandomColor(Random rgn) {
  var a = rgn.nextInt(255);
  var r = rgn.nextInt(255);
  var g = rgn.nextInt(255);
  var b = rgn.nextInt(255);
  return Color.fromARGB(a, r, g, b);
}

class PainterCanvas extends CustomPainter {
  List<Particle> particles;
  late double animationValue;
  Random rgn;
  PainterCanvas(
      {required this.rgn,
      required this.particles,
      required double animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      var velocity = PolarToCartesian(p.speed, p.theta);
      var dx = p.position.dx + velocity.dx;
      var dy = p.position.dy + velocity.dy;

      if (p.position.dx < 0 || p.position.dx > size.width) {
        dx = rgn.nextDouble() * size.width;
      }
      if (p.position.dy < 0 || p.position.dy > size.height) {
        dy = rgn.nextDouble() * size.height;
      }
      p.position = Offset(dx, dy);
    }

    for (var p in particles) {
      var paint = Paint();
      paint.color = Colors.blue;
      canvas.drawCircle(p.position, p.radius, paint);
    }
    //
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
