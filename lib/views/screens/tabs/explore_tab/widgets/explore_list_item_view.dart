import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/providers/explore_tab_provider/explore_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/send_back_bar_with_title.dart';
import 'package:provider/provider.dart';

import 'cards/explore_resource_card.dart';

class ExploreListItemView extends StatelessWidget {
  const ExploreListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var exploreTapProvider = Provider.of<ExploreTabProvider>(context);
    var activeItemData = exploreTapProvider.designResourcesCollection!.data[exploreTapProvider.showListItemViewIndex];
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 660,
      // height: 300,
      child: Wrap(
        spacing: MySpaceSystem.spaceX3,
        runSpacing: MySpaceSystem.spaceX3,
        // direction: Axis.vertical,
        children: [
          SendBackBarWithTitle(
            title: activeItemData.title,
            margin: EdgeInsets.only(bottom: MySpaceSystem.spaceX1),
            onTap: () {
              exploreTapProvider.setActiveItemView(index: 0, viewValue: false);
              // snippetTabProvider.changeCollectionView(false);
              // componentTabProvider.changeOpenActiveComponentCollectionView(false);
            },
          ),
          for (var i = 0; i < activeItemData.resourcesList.length; i++)
            ExploreResourceCard(
              onTap: () {},
              title: activeItemData.resourcesList[i].title,
              description: activeItemData.resourcesList[i].description,
              resourceUrl: activeItemData.resourcesList[i].url,
            )
                .animate()
                .scaleXY(
                  begin: 0.2,
                  alignment: Alignment.bottomLeft,
                )
                .then()
                .saturate(begin: 0, delay: 100.ms, duration: 400.ms)
                .then()
                .shakeX(delay: 200.ms, hz: 8, amount: i == 0 ? 4 : 0)
        ],
      ),
    );
  }
}
