import 'package:flutter/material.dart';

import '../../../../theme/my_colors.dart';
import '../../../../theme/my_design_system.dart';
import '../../../../theme/my_theme.dart';
import '../../../widgets/container_pattern_painter.dart';
import 'sidebar_button.dart';

enum SideTabType { collection, category, manageMedia, leaderboard, addQuizzes, addLevels, addQuestions }

class AdminViewSideBar extends StatelessWidget {
  AdminViewSideBar({Key? key, required this.onSideTabButtonChange, required this.activeButtonType}) : super(key: key);

  final Function(SideTabType newTabChange) onSideTabButtonChange;
  final SideTabType activeButtonType;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      width: 244,
      constraints: BoxConstraints(minHeight: 800),
      // padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: cardShadow,
        // border: Border.all(width: 5),
        borderRadius: BorderRadius.circular(12),
        // color: Color.fromARGB(255, 23, 22, 32),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX3),
            child: Center(
              child: SizedBox(
                width: 154,
                height: 100,
                child: Image.network("https://i.ibb.co/6FfsC8x/logo.png"),
              ),
            ),
          ),
          Divider(height: 2, thickness: 1, color: themeData.colorScheme.outline),
          // SizedBox(height: MySpaceSystem.spaceX3),
          // Group A

          SideBarButtonsGroupWidget(
            groupTitle: 'Public',
            groupChildren: [
              SideBarButton(
                title: 'Explore',
                iconData: Icons.explore_rounded,
                isActive: activeButtonType == SideTabType.collection ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.collection);
                },
              ),
              SideBarButton(
                title: 'Category',
                iconData: Icons.category_rounded,
                isActive: activeButtonType == SideTabType.category ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.category);
                },
              ),
              SideBarButton(
                title: 'Leaderboard',
                iconData: Icons.leaderboard_rounded,
                isActive: activeButtonType == SideTabType.leaderboard ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.leaderboard);
                },
              ),
              SideBarButton(
                title: 'Media',
                iconData: Icons.perm_media_rounded,
                isActive: activeButtonType == SideTabType.manageMedia ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.manageMedia);
                },
              ),
            ],
          ),
          // Group B
          SideBarButtonsGroupWidget(
            groupTitle: 'Your',
            groupChildren: [
              SideBarButton(
                title: 'Components',
                iconData: Icons.layers_rounded,
                isActive: activeButtonType == SideTabType.addQuizzes ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.addQuizzes);
                },
              ),
              SideBarButton(
                title: 'Learning',
                iconData: Icons.video_library_rounded,
                isActive: activeButtonType == SideTabType.addLevels ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.addLevels);
                },
              ),
              // SideBarButton(
              //   title: 'Design System',
              //   iconData: Icons.video_library_rounded,
              //   isActive: activeButtonType == SideTabType.addLevels ? true : false,
              //   onTap: () {
              //     onSideTabButtonChange(SideTabType.addLevels);
              //   },
              // ),
              SideBarButton(
                title: 'Saved',
                iconData: Icons.save_rounded,
                isActive: activeButtonType == SideTabType.addQuestions ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.addQuestions);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
