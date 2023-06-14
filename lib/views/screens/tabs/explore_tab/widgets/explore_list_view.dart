import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/providers/explore_tab_provider/explore_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/send_back_bar_with_title.dart';
import 'package:provider/provider.dart';

import 'cards/explore_resource_collection_card.dart';

class ExploreListView extends StatelessWidget {
  const ExploreListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var exploreTapProvider = Provider.of<ExploreTabProvider>(context);
    var designResourcesCollection = exploreTapProvider.designResourcesCollection!;
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 660,
      // height: 300,
      child: Wrap(
        spacing: MySpaceSystem.spaceX3,
        runSpacing: MySpaceSystem.spaceX3,
        // direction: Axis.vertical,
        children: [
          for (var i = 0; i < designResourcesCollection.data.length; i++)
            ExploreResourceCollectionCard(
              description: designResourcesCollection.data[i].description,
              onTap: () {
                exploreTapProvider.setActiveItemView(index: i, viewValue: true);
              },
              // get popular resource or get first resource url
              popularResourceUrl: designResourcesCollection.data[i].popularResourceUrl == 'https://fonts.google.com/'
                  ? designResourcesCollection.data[i].resourcesList.first.url
                  : designResourcesCollection.data[i].popularResourceUrl,
              resourcesCount: designResourcesCollection.data[i].resourcesCount.toString(),
              title: designResourcesCollection.data[i].title,
            )
                .animate()
                .scaleXY(begin: 0.2, alignment: Alignment.bottomLeft)
                .then()
                .saturate(begin: 0, delay: 0.ms, duration: 300.ms)
                .animate(target: i == 1 ? 1 : 0)
                .shake(delay: 800.ms, hz: 5)
        ],
      ),
    );
  }
}
