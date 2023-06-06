import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class ButtonWithTitleAndIcon extends StatelessWidget {
  const ButtonWithTitleAndIcon({
    super.key,
    required this.buttonTitle,
    required this.icon,
    required this.onTap,
  });

  final String buttonTitle;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: onTap,
      child: Container(
        height: 44,
        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          // color: themeData.colorScheme.secondary,
          boxShadow: cardShadow,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: icon,
            ),
            SizedBox(width: MySpaceSystem.spaceX1),
            Text(buttonTitle, style: MyTextTypeSystem.bodyLarge),
          ],
        )),
      ),
    );
  }
}
