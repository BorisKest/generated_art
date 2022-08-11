import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Particle {
  late Offset position;
  Color color = const Color.fromARGB(0, 0, 0, 0);

  late double speed;
  late double theta;

  double radius = 0;
}
