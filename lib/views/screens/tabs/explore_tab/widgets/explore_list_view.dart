import 'package:flutter/material.dart';
import 'package:help_me_design/providers/explore_tab_provider/explore_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/send_back_bar_with_title.dart';
import 'package:provider/provider.dart';

class ExploreListView extends StatelessWidget {
  const ExploreListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var exploreTapProvider = Provider.of<ExploreTabProvider>(context);
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 660,
      // height: 300,
      child: Wrap(
        spacing: MySpaceSystem.spaceX3,
        runSpacing: MySpaceSystem.spaceX3,
        // direction: Axis.vertical,
        children: [
          for (var i = 0; i < exploreTapProvider.designResourcesCollection!.data.length; i++)
            ButtonTapEffect(
              onTap: () {
                exploreTapProvider.setActiveItemView(index: i, viewValue: true);
              },
              child: Container(
                height: 240,
                width: 220,
                padding: EdgeInsets.all(MySpaceSystem.spaceX3),
                decoration: BoxDecoration(
                  boxShadow: cardShadow,
                  borderRadius: BorderRadius.circular(8),
                  color: themeData.colorScheme.secondary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Icon(Icons.design_services),
                    SizedBox(
                      width: 38,
                      height: 38,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          "http://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${exploreTapProvider.designResourcesCollection!.data[i].popularResourceUrl}&size=128",
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.design_services),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exploreTapProvider.designResourcesCollection!.data[i].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: themeData.textTheme.titleMedium,
                        ),
                        SizedBox(height: MySpaceSystem.spaceX2),
                        Text(
                          '${exploreTapProvider.designResourcesCollection!.data[i].description}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: themeData.textTheme.bodyMedium,
                        ),
                        SizedBox(height: MySpaceSystem.spaceX2),
                        Text(
                          'Count: ${exploreTapProvider.designResourcesCollection!.data[i].resourcesCount}',
                          style: themeData.textTheme.bodySmall,
                        ),
                        SizedBox(height: MySpaceSystem.spaceX1),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
