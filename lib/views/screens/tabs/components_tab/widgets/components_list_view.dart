import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/add_icon_with_animation.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/tag_widget.dart';
import 'package:provider/provider.dart';

import 'add_component_collection_alert.dart';

class ComponentsListView extends StatefulWidget {
  ComponentsListView({
    super.key,
  });

  @override
  State<ComponentsListView> createState() => _ComponentsListViewState();
}

class _ComponentsListViewState extends State<ComponentsListView> {
  final List snippetCollectionList = [
    "def",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var authService = Provider.of<AuthService>(context, listen: false);
    var componentTabProvider = Provider.of<ComponentTabProvider>(context, listen: false);
    componentTabProvider.getComponentsCollectionData(authService.currentUser.$id);
  }

  @override
  Widget build(BuildContext context) {
    var componentTabProvider = Provider.of<ComponentTabProvider>(context);
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 660,
      // height: 300,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: MySpaceSystem.spaceX3,
        runSpacing: MySpaceSystem.spaceX3,
        // direction: Axis.vertical,
        children: [
          AddComponentCollectionCard(
            onTap: () {
              UtilityHelper.showAlertMyDialog(
                context: context,
                bodyWidget: AddComponentCollectionAlert(),
              );
            },
          ),
          for (var i = 0; i < componentTabProvider.componentsCollectionData.length; i++)
            ComponentCollectionCard(
              onTap: () {
                componentTabProvider.changeActiveComponentViewIndex(0);
                componentTabProvider.changeOpenActiveComponentCollectionView(true, i);
              },
              title: componentTabProvider.componentsCollectionData[i].data['title'],
              tags: componentTabProvider.componentsCollectionData[i].data['tags'],
              addedAt: componentTabProvider.componentsCollectionData[i].$createdAt.split("T").first,
            ),
        ],
      ),
    );
  }
}

class ComponentCollectionCard extends StatelessWidget {
  const ComponentCollectionCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.tags,
    required this.addedAt,
  });

  final VoidCallback onTap;
  final String title;
  final String tags;
  final String addedAt;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: onTap,
      child: Container(
        height: 154,
        width: 300,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
          boxShadow: cardShadow,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (var tag in tags.split(',')) Tag(title: tag),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: themeData.textTheme.titleMedium,
                ),
                SizedBox(height: MySpaceSystem.spaceX2),
                Text('$addedAt', style: themeData.textTheme.bodyMedium),
              ],
            ).animate().moveX(begin: -154, delay: 200.ms, duration: 400.ms, curve: Curves.easeInOutBack),
          ],
        ),
      ),
    ).animate().scaleXY(begin: 0);
  }
}

class AddComponentCollectionCard extends StatelessWidget {
  const AddComponentCollectionCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: onTap,
      child: Material(
        elevation: 3,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          height: 150,
          width: 300,
          // padding: EdgeInsets.all(MySpaceSystem.spaceX2),
          decoration: BoxDecoration(
            boxShadow: cardShadow,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: themeData.colorScheme.primary,
            // border: Border.all(width: 1, color: themeData.colorScheme.outline),
          ),
          child: DottedBorder(
            color: themeData.colorScheme.outline,
            radius: Radius.circular(8),
            borderType: BorderType.RRect,
            strokeWidth: 2,
            dashPattern: const [5, 4],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddIconWithAnimation(
                    color: themeData.colorScheme.secondary,
                    size: 44,
                  ),
                  SizedBox(height: MySpaceSystem.spaceX2),
                  Text(
                    'Components Collection',
                    style: themeData.textTheme.bodyMedium!.copyWith(
                      color: themeData.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).animate().shake(delay: 1000.ms);
  }
}
