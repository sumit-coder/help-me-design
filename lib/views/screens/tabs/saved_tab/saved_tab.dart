import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';
import 'package:help_me_design/constants/text_constants.dart';
import 'package:help_me_design/providers/saved_tab_provider/saved_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/screens/tabs/explore_tab/widgets/cards/explore_resource_card.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';
import 'package:provider/provider.dart';

import '../widgets/tab_view_hero_card.dart';

class SavedDesignResourceTab extends StatefulWidget {
  const SavedDesignResourceTab({Key? key}) : super(key: key);

  @override
  State<SavedDesignResourceTab> createState() => _SavedDesignResourceTabState();
}

class _SavedDesignResourceTabState extends State<SavedDesignResourceTab> {
  @override
  void initState() {
    // TODO: implement initState
    var savedTabProvider = Provider.of<SavedTabProvider>(context, listen: false);
    var authProvider = Provider.of<AuthService>(context, listen: false);
    savedTabProvider.getSavedDesignResources(authProvider.currentUser.$id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var savedTabProvider = Provider.of<SavedTabProvider>(context);
    var authProvider = Provider.of<AuthService>(context);
    return Container(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabViewHeroCard(
              title: MyTextConstants.savedTabHeadline,
              shortDescription: MyTextConstants.savedTabShortDescription,
              posterImage: 'assets/images/settings-poster.png',
              bgPattern: SavedTabPatternPainter(44, context),
            ),
            Padding(
              padding: EdgeInsets.only(left: MySpaceSystem.spaceX3),
              child: Wrap(
                spacing: MySpaceSystem.spaceX3,
                runSpacing: MySpaceSystem.spaceX3,
                // direction: Axis.vertical,
                children: [
                  for (var i = 0; i < savedTabProvider.listOfSavedDesignResources.length; i++)
                    ExploreResourceCard(
                      onTapSave: () async {
                        // this is delete button here
                        // save design resources
                        var deleteResponse = await DatabasesService.delete.savedDesignResource(
                          docId: savedTabProvider.listOfSavedDesignResources[i].$id,
                        );

                        if (deleteResponse) {
                          savedTabProvider.getSavedDesignResources(authProvider.currentUser.$id);
                          UtilityHelper.toastMessage(message: "Resource deleted");
                        }
                      },
                      onTap: () {},
                      onTapSaveIconData: Icons.delete_rounded,
                      title: savedTabProvider.listOfSavedDesignResources[i].data['title'],
                      description: savedTabProvider.listOfSavedDesignResources[i].data['description'],
                      resourceUrl: savedTabProvider.listOfSavedDesignResources[i].data['url'],
                    )
                        .animate()
                        .scaleXY(
                          begin: 0.2,
                          alignment: Alignment.bottomLeft,
                        )
                        .then()
                        .saturate(begin: 0, delay: 100.ms, duration: 400.ms)
                        .animate(target: i == 1 ? 1 : 0)
                        .shake(delay: 800.ms, hz: 5)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
