import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';

import '../../../widgets/container_pattern_painter.dart';
import '../widgets/tab_view_hero_card.dart';

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
            TabViewHeroCard(
              // title: MyTextConstants.docsTabHeadline,
              title: "Explore.",
              shortDescription:
                  "Welcome to HelpMeDesign, \nHere you can Explore, Add & Create. Design Resources, Design Systems, UI Components etc.",
              posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
              bgPattern: ContainerPatternPainter(70, context),
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
