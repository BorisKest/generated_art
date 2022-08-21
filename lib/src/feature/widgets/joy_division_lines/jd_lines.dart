import 'package:flutter/material.dart';
import 'package:generated_art/src/feature/widgets/drawer.dart';
import 'package:generated_art/src/feature/widgets/joy_division_lines/jd_painter.dart';

class JdLines extends StatefulWidget {
  const JdLines({Key? key}) : super(key: key);

  @override
  State<JdLines> createState() => _JdLinesState();
}

class _JdLinesState extends State<JdLines> {
  double iter = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: JdPainter(iter),
        child: Container(),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
