import 'package:flutter/material.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

import '../../theme/my_colors.dart';

class ContainerPatternPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  ContainerPatternPainter(this.featuresCount, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Dots(
      bgColor: Colors.transparent,
      fgColor: MyColors.actionColor,
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ContainerSquarePatternPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  ContainerSquarePatternPainter(this.featuresCount, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    TexturePattern(
      bgColor: Colors.transparent,
      fgColor: Color(0xFF1A1A1A),
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ContainerSquarePatternTwoPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  ContainerSquarePatternTwoPainter(this.featuresCount, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    DiagonalStripesLight(
      bgColor: Colors.transparent,
      fgColor: Color(0xFF1A1A1A),
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ContainerSquarePatternThreePainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  ContainerSquarePatternThreePainter(this.featuresCount, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    DiagonalStripesLight(
      bgColor: Colors.transparent,
      fgColor: Theme.of(context).colorScheme.secondary.withOpacity(1),
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
