import 'package:flutter/material.dart';
import 'package:help_me_design/constants/text_constants.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';

import '../widgets/tab_view_hero_card.dart';

class SavedDesignResourceTab extends StatelessWidget {
  const SavedDesignResourceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 200,
      // color: Colors.deepPurple,
      child: Column(
        children: [
          TabViewHeroCard(
            title: MyTextConstants.savedTabHeadline,
            shortDescription: MyTextConstants.savedTabShortDescription,
            posterImage: 'assets/images/settings-poster.png',
            bgPattern: SavedTabPatternPainter(44, context),
          ),
        ],
      ),
    );
  }
}
