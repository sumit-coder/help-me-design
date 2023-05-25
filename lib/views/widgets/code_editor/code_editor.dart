import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_colors.dart';

import '../../../theme/my_design_system.dart';

import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class CodeEditor extends StatelessWidget {
  const CodeEditor({
    super.key,
    required this.codeColor,
    required this.codeText,
  });

  final Color codeColor;
  final String codeText;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.maxFinite,
            decoration: BoxDecoration(color: codeColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Text("Flutter alert widget", style: themeData.textTheme.bodyLarge),
                Text("Flutter alert widget", style: themeData.textTheme.bodyMedium),
              ],
            ),
          ),
          SizedBox(height: MySpaceSystem.spaceX2),
          Container(
            // height: 100,
            constraints: BoxConstraints(maxHeight: 450),
            width: double.maxFinite,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: codeColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  height: 74,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.secondary,
                  ),
                  child: Row(
                    children: [],
                  ),
                ),
                Divider(height: 1, thickness: 1, color: themeData.colorScheme.outline),
                Expanded(
                  child: CodeTheme(
                    data: CodeThemeData(styles: atomOneDarkTheme),
                    child: CodeField(
                      wrap: true,
                      textSelectionTheme: TextSelectionThemeData(),
                      lineNumberStyle: LineNumberStyle(margin: 16),
                      background: DesignSystemColors.secondaryColorDark,
                      controller: CodeController(
                        text: codeText,
                        language: javascript,
                      ),
                      textStyle: TextStyle(fontFamily: 'SourceCode'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
