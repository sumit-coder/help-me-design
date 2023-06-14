import 'package:flutter/material.dart';

import '../../theme/my_design_system.dart';

class DividerWithTitle extends StatelessWidget {
  const DividerWithTitle({
    super.key,
    required this.title,
    this.margin,
  });

  final String title;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      margin: margin,
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 2, height: 1, color: themeData.colorScheme.outline)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX1),
            child: Text(title, style: themeData.textTheme.bodySmall),
          ),
          Expanded(child: Divider(thickness: 2, height: 1, color: themeData.colorScheme.outline)),
        ],
      ),
    );
  }
}
