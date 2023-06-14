import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AddIconWithAnimation extends StatelessWidget {
  AddIconWithAnimation({Key? key, required this.color, this.size}) : super(key: key);

  final Color color;
  final double? size;

  var rnd = Random();
//  int r = rnd.nextInt(10 );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(
      Icons.add_rounded,
      color: color,
      size: size,
    )
        // .animate().shakeX(delay: 200.ms, hz: rnd.nextInt(9).toDouble()).shakeY(hz: rnd.nextInt(9).toDouble()),
        );
  }
}
