import 'dart:math';

import 'package:flutter/material.dart';
import 'package:generated_art/src/feature/widgets/bubbles/painter_canvas.dart';
import 'package:generated_art/src/feature/widgets/bubbles/particle.dart';
import 'package:generated_art/src/feature/widgets/drawer.dart';

class Painter extends StatefulWidget {
  const Painter({Key? key}) : super(key: key);

  @override
  State<Painter> createState() => _PainterState();
}

class _PainterState extends State<Painter> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late List<Particle> particles = <Particle>[];
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

    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        if (this.particles.length == 0 || this.particles.length == 1) {
          // create
          createBlobField();
        } else {
          //update
        }
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();

    particles = List.generate(300, (index) {
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
        painter: PainterCanvas(
            particles: particles, rgn: rgn, animationValue: animation.value),
        child: Container(),
      ),
      drawer: const DrawerWidget(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void createBlobField() {
    final size = MediaQuery.of(context).size;
    final o = Offset(size.width / 2, size.height / 2); // center of the screen
    final n = 5;
    final r = size.width / n;
    final a = 0.2;
    blobField(r, n, a, o);
  }

  void blobField(double r, int n, double a, Offset o) {
    this.particles.add(Particle()
      ..radius = r
      ..position = o
      ..color = Colors.red);
  }
}
