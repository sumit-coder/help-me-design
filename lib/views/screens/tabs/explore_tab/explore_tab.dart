
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';

import '../../../widgets/container_pattern_painter.dart';

class ExploreView extends StatelessWidget {
  ExploreView({Key? key}) : super(key: key);

  List<String> _items = ['q', 'm', '007', 'J', 'q', 'm'];

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      alignment: Alignment.topCenter,
      // color: Colors.red,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
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
                    painter: ContainerPatternPainter(70, context),
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
                        child: Image.network(
                          "https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png",
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
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            color: DesignSystemColors.primaryColor,
                            child: Text(
                              'Explore.',
                              style: MyTextTypeSystem.titleXXLargeDark.copyWith(fontSize: 34, height: 1.0),
                            ),
                          ),
                          SizedBox(height: MySpaceSystem.spaceX3),
                          Container(
                            padding: EdgeInsets.all(4),
                            color: DesignSystemColors.primaryColor,
                            child: Text(
                              'Welcome to HelpMeDesign, \nHere you can Explore, Add & Create. Design Resources, Design Systems, UI Components etc.',
                              style: MyTextTypeSystem.titleMediumDark.copyWith(height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
              // width: 660,
              // height: 300,
              child: Wrap(
                spacing: MySpaceSystem.spaceX3,
                runSpacing: MySpaceSystem.spaceX3,
                // direction: Axis.vertical,
                children: [
                  for (var i in _items)
                    Container(
                      height: 200,
                      width: 220,
                      decoration: BoxDecoration(
                        boxShadow: cardShadow,
                        borderRadius: BorderRadius.circular(8),
                        color: themeData.colorScheme.secondary,
                      ),
                      child: Text('adf'),
                    ),
                ],
              ),
            )
          ],
        ).animate().scaleXY(begin: 0.1).move(begin: Offset(-300, -100)).flipH(begin: -0.1),
      ),
    );
  }
}
