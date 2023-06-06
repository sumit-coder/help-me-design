import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return TextFormField(
      // controller: nameEditingController,
      cursorColor: MyColors.actionColor,
      maxLines: 1,
      style: themeData.textTheme.bodyLarge!.copyWith(decoration: TextDecoration.none),
      decoration: InputDecoration(
        suffixIcon: ButtonTapEffect(
          margin: EdgeInsets.only(right: 4),
          onTap: () {},
          child: Icon(Icons.visibility_off_rounded, color: themeData.colorScheme.outline),
        ),
        filled: true,
        fillColor: themeData.colorScheme.secondary,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX3, vertical: MySpaceSystem.spaceX3),
        hintText: 'Password',
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
