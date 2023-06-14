import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/constants/text_constants.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/screens/tabs/widgets/tab_view_hero_card.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';

import 'widgets/inspiration_list_view.dart';

class InspirationTab extends StatelessWidget {
  const InspirationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 200,
      // color: Colors.deepPurple,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TabViewHeroCard(
              // title: MyTextConstants.docsTabHeadline,
              title: MyTextConstants.inspirationsTabHeadline,
              shortDescription: MyTextConstants.inspirationTabShortDescription,

              posterImage: "assets/images/insp-poster.png",
              bgPattern: InspirationTabPatternPainter(44, context),
            ),
            InspirationsListView(),
          ],
        ),
      ),
    );
  }
}
