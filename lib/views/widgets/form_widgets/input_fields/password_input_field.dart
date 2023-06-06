import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    super.key,
    required this.passwordEditingController,
    this.isNeedVisibilityButton,
    this.customHintText,
  });

  final TextEditingController passwordEditingController;
  final bool? isNeedVisibilityButton;
  final String? customHintText;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isObscurePassword = widget.isNeedVisibilityButton != true ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return TextFormField(
      controller: widget.passwordEditingController,
      cursorColor: MyColors.actionColor,
      maxLines: 1,
      style: themeData.textTheme.bodyLarge!.copyWith(decoration: TextDecoration.none),
      obscureText: isObscurePassword,
      decoration: InputDecoration(
        suffixIcon: widget.isNeedVisibilityButton == true
            ? ButtonTapEffect(
                margin: EdgeInsets.only(right: 4),
                onTap: () {
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                },
                child: Icon(
                  isObscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  color: themeData.colorScheme.outline,
                ),
              )
            : SizedBox(),
        filled: true,
        fillColor: themeData.colorScheme.secondary,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX3, vertical: MySpaceSystem.spaceX3),
        hintText: widget.customHintText ?? 'Password',
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
