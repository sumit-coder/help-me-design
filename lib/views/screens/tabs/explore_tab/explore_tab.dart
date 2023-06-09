import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';
import 'package:help_me_design/providers/explore_tab_provider/explore_tab_provider.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:provider/provider.dart';

import '../../../../models/design_resources_model.dart';
import '../../../widgets/container_pattern_painter.dart';
import '../widgets/tab_view_hero_card.dart';
import 'widgets/explore_list_item_view.dart';
import 'widgets/explore_list_view.dart';

class ExploreView extends StatelessWidget {
  ExploreView({Key? key}) : super(key: key);

  List<String> _items = [
    'q',
    'm',
    '007',
    'J',
    'q',
    'm',
    'm',
    'm',
  ];

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var exploreTapProvider = Provider.of<ExploreTabProvider>(context);

    return Container(
      alignment: Alignment.topCenter,
      // color: Colors.red,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            exploreTapProvider.showListItemView
                ? SizedBox()
                : TabViewHeroCard(
                    // title: MyTextConstants.docsTabHeadline,
                    title: "Explore.",
                    shortDescription:
                        "Welcome to HelpMeDesign, \nHere you can Explore, Add & Create. Design Resources, Design Systems, UI Components etc.",
                    posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
                    bgPattern: ContainerPatternPainter(70, context),
                  ),
            IconButton(
              onPressed: () {
                // DatabasesService().getDesignResourcesData();
                exploreTapProvider.initDesignResourcesData();
              },
              icon: const Icon(Icons.abc),
            ),
            AnimatedSwitcher(
              duration: 500.ms,
              child: exploreTapProvider.showListItemView ? ExploreListItemView() : ExploreListView(),
            ),
          ],
        ).animate().scaleXY(begin: 0.1).move(begin: const Offset(-300, -100)).flipH(begin: -0.1),
      ),
    );
  }
}
