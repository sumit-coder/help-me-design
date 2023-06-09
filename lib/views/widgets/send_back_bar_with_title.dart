import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class SendBackBarWithTitle extends StatelessWidget {
  const SendBackBarWithTitle({
    super.key,
    required this.title,
    required this.onTap,
    this.margin,
  });

  final String title;
  final VoidCallback onTap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      height: 64,
      padding: EdgeInsets.all(MySpaceSystem.spaceX1),
      margin: margin ?? EdgeInsets.only(left: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX3),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: themeData.colorScheme.secondary,
        boxShadow: cardShadow,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ButtonTapEffect(
            onTap: () {
              onTap();
            },
            child: Container(
              height: 51,
              width: 51,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: themeData.colorScheme.primary,
              ),
              child: Icon(Icons.arrow_back, size: 24),
            ),
          ),
          SizedBox(width: MySpaceSystem.spaceX2),
          Text(title, style: themeData.textTheme.titleMedium)
        ],
      ),
    );
  }
}
