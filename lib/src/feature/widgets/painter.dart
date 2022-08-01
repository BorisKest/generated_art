import 'dart:math';

import 'package:flutter/material.dart';
import 'package:generated_art/src/feature/widgets/painter_canvas.dart';
import 'package:generated_art/src/feature/widgets/particle.dart';

class Painter extends StatefulWidget {
  const Painter({Key? key}) : super(key: key);

  @override
  State<Painter> createState() => _PainterState();
}

class _PainterState extends State<Painter> {
  List<Particle> particles = [];
  Random rgn = Random(DateTime.now().millisecondsSinceEpoch);
  double maxRadius = 6;
  double maxSpeed = 0.2;
  double maxTheta = 2.0 * pi;

  Color getRandomColor(Random rgn) {
    var a = rgn.nextInt(255);
    var r = rgn.nextInt(255);
    var g = rgn.nextInt(255);
    var b = rgn.nextInt(255);
    return Color.fromARGB(a, r, g, b);
  }

  @override
  void initState() {
    super.initState();
    particles = List.generate(100, (index) {
      var p = Particle();
      p.color = getRandomColor(rgn);
      p.position = const Offset(-1, -1);
      p.speed = rgn.nextDouble() * maxSpeed;
      p.theta = rgn.nextDouble() * maxTheta;
      p.radius = rgn.nextDouble() * maxRadius;
      return p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: PainterCanvas(particles: particles, rgn: rgn),
        child: Container(),
      ),
    );
  }
}
