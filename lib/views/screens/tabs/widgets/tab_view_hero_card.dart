import 'package:flutter/material.dart';

import '../../../../constants/text_constants.dart';
import '../../../../theme/my_colors.dart';
import '../../../../theme/my_design_system.dart';
import '../../../../theme/my_theme.dart';
import '../../../widgets/container_pattern_painter.dart';

class TabViewHeroCard extends StatelessWidget {
  const TabViewHeroCard({
    super.key,
    required this.title,
    required this.shortDescription,
    required this.bgPattern,
    required this.posterImage,
  });

  final String title;
  final String shortDescription;
  final String posterImage;
  final CustomPainter bgPattern;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX3),
      decoration: BoxDecoration(
        boxShadow: cardShadow,
        borderRadius: BorderRadius.circular(8),
        color: themeData.colorScheme.secondary,
      ),
      // width: 630,
      height: 250,
      child: Stack(
        children: [
          CustomPaint(
            painter: bgPattern,
            child: Container(),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: SizedBox(
              // width: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.asset(
                  posterImage,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: MySpaceSystem.spaceX3,
            bottom: MySpaceSystem.spaceX3,
            child: SizedBox(
              width: 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    color: DesignSystemColors.primaryColor,
                    child: Text(
                      title,
                      style: MyTextTypeSystem.titleXXLargeDark.copyWith(fontSize: 34, height: 1.0),
                    ),
                  ),
                  SizedBox(height: MySpaceSystem.spaceX2),
                  Container(
                    padding: const EdgeInsets.all(4),
                    color: DesignSystemColors.primaryColor,
                    child: Text(
                      shortDescription,
                      style: MyTextTypeSystem.titleMediumDark.copyWith(height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
