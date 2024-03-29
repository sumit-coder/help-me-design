import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/providers/snippet_tab_provider/snippet_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/add_icon_with_animation.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/tag_widget.dart';
import 'package:provider/provider.dart';

import 'add_code_snippet_collection_alert.dart';

class CodeSnippetsListView extends StatefulWidget {
  CodeSnippetsListView({
    super.key,
  });

  @override
  State<CodeSnippetsListView> createState() => _CodeSnippetsListViewState();
}

class _CodeSnippetsListViewState extends State<CodeSnippetsListView> {
  final List snippetCollectionList = ["def"];

  @override
  void initState() {
    // TODO: implement initState
    var authService = Provider.of<AuthService>(context, listen: false);
    var snippetTabProvider = Provider.of<SnippetTabProvider>(context, listen: false);
    snippetTabProvider.getSnippetsData(authService.currentUser.$id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var snippetTabProvider = Provider.of<SnippetTabProvider>(context);

    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 660,
      // height: 300,
      child: Wrap(
        spacing: MySpaceSystem.spaceX3,
        runSpacing: MySpaceSystem.spaceX3,
        // direction: Axis.vertical,
        children: [
          AddCodeSnippetCard(
            onTap: () {
              UtilityHelper.showAlertMyDialog(
                context: context,
                bodyWidget: AddCodeSnippetCollectionAlert(),
              );
              // snippetTabProvider.getSnippetsData(authService.currentUser.$id);
              // print(authService.currentUser.$id);
            },
          ),
          for (var i = 0; i < snippetTabProvider.snippetsCollectionData.length; i++)
            SnippetsCollectionCard(
              onTap: () {
                snippetTabProvider.changeCollectionView(true, i);
              },
              title: snippetTabProvider.snippetsCollectionData[i].data['title'],
              tags: snippetTabProvider.snippetsCollectionData[i].data['tags'],
              snippetsCount: snippetTabProvider.snippetsCollectionData[i].$createdAt.split("T").first,
            ),
        ],
      ),
    );
  }
}

class SnippetsCollectionCard extends StatelessWidget {
  const SnippetsCollectionCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.tags,
    required this.snippetsCount,
  });

  final VoidCallback onTap;
  final String title;
  final String tags;
  final String snippetsCount;

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
                  style: themeData.textTheme.titleSmall,
                ),
                SizedBox(height: MySpaceSystem.spaceX2),
                Text('$snippetsCount', style: themeData.textTheme.bodyMedium),
              ],
            ).animate().moveX(begin: -154, delay: 200.ms, duration: 400.ms, curve: Curves.easeInOutBack),
          ],
        ),
      ),
    ).animate().scaleXY(begin: 0);
  }
}

class AddCodeSnippetCard extends StatelessWidget {
  const AddCodeSnippetCard({
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
                    'Snippet Collection',
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
