import 'package:flutter/material.dart';

import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class ComponentCard extends StatelessWidget {
  const ComponentCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.isActive,
  });

  final VoidCallback onTap;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      margin: EdgeInsets.only(bottom: MySpaceSystem.spaceX2),
      onTap: () {
        onTap();
      },
      child: Container(
        height: 64,
        width: 300,
        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
          boxShadow: cardShadow,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            isActive
                ? Positioned(
                    child: Icon(
                      Icons.circle_rounded,
                      color: themeData.colorScheme.primary,
                      size: 8,
                    ),
                  )
                : const SizedBox(),
            Center(
              child: Text(
                title,
                maxLines: 2,
                style: themeData.textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
