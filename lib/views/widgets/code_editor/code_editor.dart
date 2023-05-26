import 'package:code_text_field/code_text_field.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:highlight/highlight.dart';

import '../../../theme/my_design_system.dart';

import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

import 'language_import.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({
    super.key,
    required this.codeColor,
    required this.codeText,
  });

  final Color codeColor;
  final String codeText;

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  String selectedLanguage = "dart";

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX3),
      child: Column(
        children: [
          Container(
            // height: 100,
            padding: EdgeInsets.all(MySpaceSystem.spaceX3),
            width: double.maxFinite,
            decoration: BoxDecoration(color: widget.codeColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Flutter alert widget", style: themeData.textTheme.titleMedium),
                SizedBox(height: MySpaceSystem.spaceX2),
                Text("Flutter alert widget description", style: themeData.textTheme.bodyMedium),
              ],
            ),
          ),
          // SizedBox(height: MySpaceSystem.spaceX2),
          Container(
            // height: 100,
            constraints: const BoxConstraints(maxHeight: 450),
            width: double.maxFinite,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: widget.codeColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  height: 74,
                  padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX2),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          offset: const Offset(0, -4),
                          dropdownMaxHeight: 200,
                          scrollbarThickness: 4,
                          buttonHeight: 53,
                          value: selectedLanguage,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.expand_more_rounded,
                              size: 28,
                            ),
                          ),
                          items: [
                            for (MapEntry<String, Mode> item in allLanguages.entries)
                              DropdownMenuItem<String>(
                                value: item.key,
                                child: Text(item.key),
                              ),
                          ],
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: themeData.colorScheme.primary,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value ?? "dart";
                            });
                          },
                        ),
                      ),
                      ButtonTapEffect(
                        onTap: () {},
                        child: Container(
                          height: 53,
                          width: 53,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: themeData.colorScheme.primary,
                          ),
                          child: Icon(Icons.copy_all_rounded, size: 28),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(height: 1, thickness: 1, color: themeData.colorScheme.outline),
                Expanded(
                  child: CodeTheme(
                    data: const CodeThemeData(styles: atomOneDarkTheme),
                    child: CodeField(
                      wrap: true,
                      textSelectionTheme: const TextSelectionThemeData(),
                      lineNumberStyle: const LineNumberStyle(margin: 16),
                      background: DesignSystemColors.secondaryColorDark,
                      controller: CodeController(
                        text: widget.codeText,
                        // language: javascript,
                        language: allLanguages[selectedLanguage],
                      ),
                      textStyle: GoogleFonts.sourceCodePro(),
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