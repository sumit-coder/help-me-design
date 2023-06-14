import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/add_icon_with_animation.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class AddComponentCard extends StatelessWidget {
  const AddComponentCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      margin: EdgeInsets.only(bottom: MySpaceSystem.spaceX2 + 4),
      onTap: onTap,
      child: Container(
        height: 64,
        width: 300,
        padding: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          boxShadow: cardShadow,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: DottedBorder(
          // color: themeData.colorScheme.primary,
          color: themeData.colorScheme.outline,
          radius: const Radius.circular(8),
          borderType: BorderType.RRect,
          strokeWidth: 2,
          dashPattern: const [5, 4],
          padding: EdgeInsets.all(MySpaceSystem.spaceX2),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddIconWithAnimation(color: themeData.colorScheme.secondary),
                // Icon(Icons.add_rounded, color: themeData.colorScheme.secondary),
                SizedBox(width: MySpaceSystem.spaceX1),
                Text(
                  'Component',
                  maxLines: 2,
                  style: themeData.textTheme.titleSmall!.copyWith(
                    color: themeData.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
