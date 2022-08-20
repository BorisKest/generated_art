// sorce https://medium.com/@dev.n/flutter-generative-art-the-easy-way-99252486a338
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:generated_art/src/feature/widgets/drawer.dart';
import 'package:generated_art/src/feature/widgets/other_worldly/models/ow_models.dart';
import 'package:generated_art/src/feature/widgets/other_worldly/ow_painter.dart';

class OWAnimation extends StatefulWidget {
  const OWAnimation({Key? key}) : super(key: key);

  @override
  State<OWAnimation> createState() => _OWAnimationState();
}

class _OWAnimationState extends State<OWAnimation> {
  double iter = 0.0;

  var colors = List.generate(
      20, (index) => ColorList[Random().nextInt(ColorList.length)]);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then(
      ((value) async {
        for (int i = 0; i < 2000000; i++) {
          setState(() {
            iter = iter + 0.00001;
          });
          await Future.delayed(Duration(milliseconds: 50));
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CustomPaint(
        painter: DemoPainter(iter, colors),
        child: Container(),
      )),
      drawer: const DrawerWidget(),
    );
  }
}
