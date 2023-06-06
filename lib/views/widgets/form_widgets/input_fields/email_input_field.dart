import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    super.key,
    required this.emailEditingController,
  });

  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return TextFormField(
      controller: emailEditingController,
      cursorColor: MyColors.actionColor,
      maxLines: 1,
      style: themeData.textTheme.bodyLarge!.copyWith(decoration: TextDecoration.none),
      decoration: InputDecoration(
        filled: true,
        fillColor: themeData.colorScheme.secondary,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX3, vertical: MySpaceSystem.spaceX3),
        hintText: 'Email',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: themeData.colorScheme.outline), //<-- SEE HERE
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: themeData.colorScheme.primary), //<-- SEE HERE
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}
