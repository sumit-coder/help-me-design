import 'package:flutter/material.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

import '../../theme/my_colors.dart';

class ExploreTabPatternPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  ExploreTabPatternPainter(this.featuresCount, this.context);

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

//
class InspirationTabPatternPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  InspirationTabPatternPainter(this.featuresCount, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Crosshatch(
      bgColor: Colors.transparent,
      fgColor: MyColors.actionColor,
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//
class ComponentsTabPatternPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  ComponentsTabPatternPainter(this.featuresCount, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    TexturePattern(
      bgColor: Colors.transparent,
      fgColor: MyColors.actionColor,
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//
class SnippetsTabPatternPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  SnippetsTabPatternPainter(this.featuresCount, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Raindrops(
      bgColor: Colors.transparent,
      fgColor: MyColors.actionColor,
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//
class SavedTabPatternPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  SavedTabPatternPainter(this.featuresCount, this.context);

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

//
class SettingsTabPatternPainter extends CustomPainter {
  final int featuresCount;
  final BuildContext context;

  SettingsTabPatternPainter(this.featuresCount, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    VerticalStripesThick(
      bgColor: Colors.transparent,
      fgColor: MyColors.actionColor,
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
// --------------------------------------------old

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
      fgColor: MyColors.actionColor,
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
      fgColor: MyColors.actionColor,
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
    Raindrops(
      bgColor: Colors.transparent,
      fgColor: MyColors.actionColor,
      featuresCount: featuresCount,
    ).paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
