import 'package:flutter/material.dart';

import '../../../../theme/my_design_system.dart';
import '../../../../theme/my_theme.dart';
import 'sidebar_button.dart';

enum SideTabType { explore, settings, saved, codeSnippet, inspiration, components, docs }

class AdminViewSideBar extends StatefulWidget {
  const AdminViewSideBar({Key? key, required this.onSideTabButtonChange, required this.activeButtonType}) : super(key: key);

  final Function(SideTabType newTabChange) onSideTabButtonChange;
  final SideTabType activeButtonType;

  @override
  State<AdminViewSideBar> createState() => _AdminViewSideBarState();
}

class _AdminViewSideBarState extends State<AdminViewSideBar> {
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      width: 244,
      height: double.maxFinite,
      // constraints: BoxConstraints(minHeight: 800),
      // padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: cardShadow,
        // border: Border.all(width: 5),
        borderRadius: BorderRadius.circular(12),
        // color: Color.fromARGB(255, 23, 22, 32),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: SingleChildScrollView(
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
              ],
            ),
            // Group B
            SideBarButtonsGroupWidget(
              groupTitle: 'Saved',
              groupChildren: [
                SideBarButton(
                  title: 'Inspirations',
                  iconData: Icons.burst_mode_rounded,
                  isActive: widget.activeButtonType == SideTabType.inspiration ? true : false,
                  onTap: () {
                    widget.onSideTabButtonChange(SideTabType.inspiration);
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
                  title: 'Saved',
                  iconData: Icons.bookmark_added_rounded,
                  isActive: widget.activeButtonType == SideTabType.saved ? true : false,
                  onTap: () {
                    widget.onSideTabButtonChange(SideTabType.saved);
                  },
                ),
                // SideBarButton(
                //   title: 'Docs',
                //   iconData: Icons.article_rounded,
                //   isActive: widget.activeButtonType == SideTabType.docs ? true : false,
                //   onTap: () {
                //     widget.onSideTabButtonChange(SideTabType.docs);
                //   },
                // ),
              ],
            ),
            SizedBox(height: MySpaceSystem.spaceX2),
            SideBarButton(
              title: 'Settings',
              iconData: Icons.settings_rounded,
              isActive: widget.activeButtonType == SideTabType.settings ? true : false,
              onTap: () {
                widget.onSideTabButtonChange(SideTabType.settings);
              },
            ),
          ],
        ),
      ),
    );
  }
}
