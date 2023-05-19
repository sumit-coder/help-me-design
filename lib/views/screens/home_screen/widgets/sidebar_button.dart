import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../theme/my_colors.dart';
import '../../../../theme/my_design_system.dart';

class SideBarButton extends StatelessWidget {
  const SideBarButton({
    super.key,
    required this.title,
    required this.iconData,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final IconData iconData;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      height: 64,
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 10),
      decoration: BoxDecoration(
        // color: isActive ? MyColors.primaryColor : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        // onTap: onTap,
        onTapDown: (data) {
          onTap();
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: 250.ms,
              curve: Curves.ease,
              right: isActive ? 0 : 244,
              top: 0,
              bottom: 0,
              left: 0,
              child: Container(
                // height: 100,
                // width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: themeData.colorScheme.primary,
                ),
              ),
            ),
            Positioned.fill(
              left: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: 30,
                    color: isActive ? MyColors.secondaryColor : MyColors.actionColor,
                  ),
                  SizedBox(width: MySpaceSystem.spaceX2),
                  Text(
                    title,
                    style: isActive ? MyTextTypeSystem.titleLarge : themeData.textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideBarButtonsGroupWidget extends StatelessWidget {
  const SideBarButtonsGroupWidget({Key? key, required this.groupTitle, required this.groupChildren}) : super(key: key);

  final String groupTitle;
  final List<Widget> groupChildren;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      // constraints: BoxConstraints(maxHeight: 300),
      // margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(groupTitle, style: themeData.textTheme.titleSmall),
              ),
              ...groupChildren,
            ],
          ),
          Divider(
            height: 2,
            thickness: 1,
            color: themeData.colorScheme.outline,
          ),
        ],
      ),
    );
  }
}
