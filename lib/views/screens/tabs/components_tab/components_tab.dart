import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/constants/text_constants.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/views/screens/tabs/widgets/tab_view_hero_card.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';
import 'package:provider/provider.dart';

import 'widgets/components_view.dart';
import 'widgets/components_list_view.dart';

class ComponentsTab extends StatelessWidget {
  const ComponentsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var componentTabProvider = Provider.of<ComponentTabProvider>(context);
    return Container(
      // margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 500,
      // height: 200,
      // color: Colors.deepPurple,

      child: AnimatedSwitcher(
        duration: 300.ms,
        child: !componentTabProvider.openActiveComponentCollectionView
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabViewHeroCard(
                      title: MyTextConstants.componentsTabHeadline,
                      shortDescription: MyTextConstants.componentsTabShortDescription,
                      posterImage: "assets/images/explore-poster.png",
                      bgPattern: ComponentsTabPatternPainter(48, context),
                    ),
                    ComponentsListView()
                  ],
                ),
              )
            : ComponentView(),
      ),
    );
    ;
  }
}
