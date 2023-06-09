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
            IconButton(
              onPressed: () {
                DatabasesService().getDesignResourcesData();
              },
              icon: Icon(Icons.abc),
            )
            // Container(
            //   margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
            //   // width: 660,
            //   // height: 300,
            //   child: FutureBuilder<DesignResourcesCollection?>(
            //       future: DatabasesService().getDesignResourcesData(),
            //       builder: (context, snapshot) {
            //         print(snapshot.data);
            //         if (snapshot.hasData) {
            //           return Wrap(
            //             spacing: MySpaceSystem.spaceX3,
            //             runSpacing: MySpaceSystem.spaceX3,
            //             // direction: Axis.vertical,
            //             children: [
            //               for (var i in _items)
            //                 ButtonTapEffect(
            //                   onTap: () {},
            //                   child: Container(
            //                     height: 230,
            //                     width: 220,
            //                     padding: EdgeInsets.all(MySpaceSystem.spaceX3),
            //                     decoration: BoxDecoration(
            //                       boxShadow: cardShadow,
            //                       borderRadius: BorderRadius.circular(8),
            //                       color: themeData.colorScheme.secondary,
            //                     ),
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Icon(Icons.design_services),
            //                         Column(
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               'Design Systems - new on lodading form here lkjldkf',
            //                               overflow: TextOverflow.ellipsis,
            //                               maxLines: 2,
            //                               style: themeData.textTheme.bodyLarge,
            //                             ),
            //                             SizedBox(height: MySpaceSystem.spaceX2),
            //                             Text('Count: 4', style: themeData.textTheme.bodySmall),
            //                             SizedBox(height: MySpaceSystem.spaceX1),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //             ],
            //           );
            //         } else {
            //           return Center(
            //               child: CircularProgressIndicator(
            //             color: Colors.black,
            //           ));
            //         }
            //       }),
            // )
          ],
        ).animate().scaleXY(begin: 0.1).move(begin: Offset(-300, -100)).flipH(begin: -0.1),
      ),
    );
  }
}
