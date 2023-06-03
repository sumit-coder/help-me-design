import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/providers/snippet_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/tag_widget.dart';
import 'package:provider/provider.dart';

class ComponentsListView extends StatelessWidget {
  ComponentsListView({
    super.key,
  });

  final List snippetCollectionList = [
    "def",
    "def",
    "def",
    "def",
    "def",
    "def",
    "def",
    "def",
  ];
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var componentTabProvider = Provider.of<ComponentTabProvider>(context);
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 660,
      // height: 300,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: MySpaceSystem.spaceX3,
        runSpacing: MySpaceSystem.spaceX3,
        // direction: Axis.vertical,
        children: [
          AddComponentCollectionCard(),
          for (var i = 0; i < snippetCollectionList.length; i++)
            ButtonTapEffect(
              onTap: () {
                componentTabProvider.changeActiveComponentViewIndex(i);
                componentTabProvider.changeActiveComponentCollectionView(true);
              },
              child: Container(
                height: 154,
                width: 300,
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
                      children: const [
                        Tag(title: 'Flutter'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flutter utility widgets',
                          maxLines: 2,
                          style: themeData.textTheme.titleSmall,
                        ),
                        SizedBox(height: MySpaceSystem.spaceX2),
                        Text('20 Snippets', style: themeData.textTheme.bodyMedium),
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

class AddComponentCollectionCard extends StatelessWidget {
  const AddComponentCollectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: () {},
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
                  Icon(
                    Icons.add_rounded,
                    size: 44,
                    color: themeData.colorScheme.secondary,
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
    );
  }
}
