import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(
        color: DesignSystemColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: Text(title, style: MyTextTypeSystem.bodyMedium),
    );
  }
}
