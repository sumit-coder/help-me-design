import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  final VoidCallback onTap;
  final String buttonTitle;

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
        child: Center(child: Text(buttonTitle, style: MyTextTypeSystem.bodyLarge)),
      ),
    );
  }
}

class Button {
  final Function onTap;

  Button(this.onTap);
}
