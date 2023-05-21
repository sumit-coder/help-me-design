import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/my_colors.dart';
import '../../../../theme/my_design_system.dart';
import '../../../../theme/my_theme.dart';
import '../../../widgets/container_pattern_painter.dart';
import 'sidebar_button.dart';

enum SideTabType { explore, category, manageMedia, learning, codeSnippet, designSystem, components, docs }

class AdminViewSideBar extends StatefulWidget {
  AdminViewSideBar({Key? key, required this.onSideTabButtonChange, required this.activeButtonType}) : super(key: key);

  final Function(SideTabType newTabChange) onSideTabButtonChange;
  final SideTabType activeButtonType;

  @override
  State<AdminViewSideBar> createState() => _AdminViewSideBarState();
}

class _AdminViewSideBarState extends State<AdminViewSideBar> {
  @override
  Widget build(BuildContext context) {
    var themeMangerProvider = Provider.of<ThemeManager>(context, listen: false);
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
                child: Image.network("https://i.ibb.co/7YnRnRc/logo.png"),
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
                isActive: widget.activeButtonType == SideTabType.explore ? true : false,
                onTap: () {
                  widget.onSideTabButtonChange(SideTabType.explore);
                },
              ),
              SideBarButton(
                title: 'Category',
                iconData: Icons.category_rounded,
                isActive: widget.activeButtonType == SideTabType.category ? true : false,
                onTap: () {
                  widget.onSideTabButtonChange(SideTabType.category);
                },
              ),
              // SideBarButton(
              //   title: 'Leaderboard',
              //   iconData: Icons.leaderboard_rounded,
              //   isActive: widget.activeButtonType == SideTabType.leaderboard ? true : false,
              //   onTap: () {
              //     widget.onSideTabButtonChange(SideTabType.leaderboard);
              //   },
              // ),
              // SideBarButton(
              //   title: 'Media',
              //   iconData: Icons.perm_media_rounded,
              //   isActive: widget.activeButtonType == SideTabType.manageMedia ? true : false,
              //   onTap: () {
              //     widget.onSideTabButtonChange(SideTabType.manageMedia);
              //   },
              // ),
            ],
          ),
          // Group B
          SideBarButtonsGroupWidget(
            groupTitle: 'Saved',
            groupChildren: [
              SideBarButton(
                title: 'Design System',
                iconData: Icons.design_services_rounded,
                isActive: widget.activeButtonType == SideTabType.designSystem ? true : false,
                onTap: () {
                  widget.onSideTabButtonChange(SideTabType.designSystem);
                },
              ),
              SideBarButton(
                title: 'Components',
                iconData: Icons.layers_rounded,
                isActive: widget.activeButtonType == SideTabType.components ? true : false,
                onTap: () {
                  widget.onSideTabButtonChange(SideTabType.components);
                },
              ),
              SideBarButton(
                title: 'Snippets',
                iconData: Icons.data_object_rounded,
                isActive: widget.activeButtonType == SideTabType.codeSnippet ? true : false,
                onTap: () {
                  widget.onSideTabButtonChange(SideTabType.codeSnippet);
                },
              ),
              SideBarButton(
                title: 'Learning',
                iconData: Icons.video_library_rounded,
                isActive: widget.activeButtonType == SideTabType.learning ? true : false,
                onTap: () {
                  widget.onSideTabButtonChange(SideTabType.learning);
                },
              ),
              SideBarButton(
                title: 'Docs',
                iconData: Icons.article_rounded,
                isActive: widget.activeButtonType == SideTabType.docs ? true : false,
                onTap: () {
                  widget.onSideTabButtonChange(SideTabType.docs);
                },
              ),
            ],
          ),

          IconButton(
            onPressed: () {
              if (themeMangerProvider.isDarkMode) {
                themeMangerProvider.changeThemeMode(ThemeMode.light);
                setState(() {});
                return;
              }
              themeMangerProvider.changeThemeMode(ThemeMode.dark);
              setState(() {});

              print(themeMangerProvider.getThemeMode);
            },
            icon: Icon(
              Icons.dark_mode,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
