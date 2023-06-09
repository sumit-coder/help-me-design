import 'package:flutter/material.dart';
import 'package:help_me_design/providers/explore_tab_provider/explore_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/send_back_bar_with_title.dart';
import 'package:provider/provider.dart';

class ExploreListItemView extends StatelessWidget {
  const ExploreListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
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
            ButtonTapEffect(
              onTap: () {
                // exploreTapProvider.setActiveItemView(i);
              },
              child: Container(
                height: 230,
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
                      width: 34,
                      height: 34,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          "http://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${activeItemData.resourcesList[i].url}&size=128",
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.design_services),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activeItemData.resourcesList[i].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: themeData.textTheme.titleSmall,
                        ),
                        SizedBox(height: MySpaceSystem.spaceX2),
                        // Text(
                        //   activeItemData.resourcesList[i].title,
                        //   maxLines: 2,
                        //   style: themeData.textTheme.bodySmall,
                        // ),
                        SizedBox(
                          // height: 28,

                          child: Text(
                            activeItemData.resourcesList[i].description,
                            maxLines: 3,
                            style: themeData.textTheme.bodySmall,
                          ),
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
