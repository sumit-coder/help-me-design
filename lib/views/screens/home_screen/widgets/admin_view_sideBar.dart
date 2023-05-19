import 'package:flutter/material.dart';

import '../../../../theme/my_design_system.dart';
import '../../../../theme/my_theme.dart';
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
          SizedBox(height: MySpaceSystem.spaceX3),
          // const Divider(height: 2, thickness: 1, color: MyColors.primaryColor),
          // Group A
          SideBarButtonsGroupWidget(
            groupTitle: 'View Data',
            groupChildren: [
              SideBarButton(
                title: 'Collections',
                iconData: Icons.collections_bookmark_rounded,
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
            groupTitle: 'Quiz',
            groupChildren: [
              SideBarButton(
                title: 'Quizzes',
                iconData: Icons.quiz_rounded,
                isActive: activeButtonType == SideTabType.addQuizzes ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.addQuizzes);
                },
              ),
              SideBarButton(
                title: 'Levels',
                iconData: Icons.layers_rounded,
                isActive: activeButtonType == SideTabType.addLevels ? true : false,
                onTap: () {
                  onSideTabButtonChange(SideTabType.addLevels);
                },
              ),
              SideBarButton(
                title: 'Questions',
                iconData: Icons.live_help_rounded,
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
