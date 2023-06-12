import 'package:code_text_field/code_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:highlight/highlight.dart';

import '../../../theme/my_design_system.dart';

import 'package:flutter_highlight/themes/atom-one-dark.dart';

import 'language_import.dart';

class CodeEditor extends StatefulWidget {
  CodeEditor({
    super.key,
    required this.codeText,
    required this.title,
    required this.description,
    required this.codeLanguage,
    required this.onTapUpdateButton,
  });

  final String title;
  final String description;
  final String codeLanguage;
  final String codeText;
  final Function({String? newCode, String? newLanguage}) onTapUpdateButton;

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  String selectedLanguage = "dart";

  String? newChangedCode;
  String? newChangedLanguage;

  late CodeController codeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    codeController = CodeController(
      text: widget.codeText,
      language: allLanguages[widget.codeLanguage],
    );
    if (widget.codeLanguage.isNotEmpty && allLanguages.containsKey(widget.codeLanguage)) {
      setState(() {
        selectedLanguage = widget.codeLanguage;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    codeController.dispose();
    super.dispose();
  }

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
            decoration: BoxDecoration(
              color: themeData.colorScheme.secondary,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: themeData.textTheme.titleMedium),
                SizedBox(height: MySpaceSystem.spaceX1),
                Text(widget.description, style: themeData.textTheme.bodyMedium),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: themeData.colorScheme.outline),
          // SizedBox(height: MySpaceSystem.spaceX2),
          Container(
            // height: double.,
            // constraints: const BoxConstraints(maxHeight: 450),
            width: double.maxFinite,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: DesignSystemColors.secondaryColorDark,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
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
                      // select language
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
                              newChangedLanguage = value ?? "dart";
                              selectedLanguage = value ?? "dart";

                              codeController = CodeController(
                                text: newChangedCode ?? widget.codeText,
                                // language: javascript,
                                language: allLanguages[selectedLanguage],
                              );
                            });
                          },
                        ),
                      ),
                      Row(
                        children: [
                          ButtonTapEffect(
                            onTap: () {
                              if (newChangedCode == null && newChangedLanguage == null) return;

                              widget.onTapUpdateButton(newCode: newChangedCode, newLanguage: newChangedLanguage);
                            },
                            child: Container(
                              height: 53,
                              padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: themeData.colorScheme.primary,
                              ),
                              child: Center(child: Text("Update", style: themeData.textTheme.titleMedium)),
                            ),
                          ),
                          SizedBox(width: MySpaceSystem.spaceX2),
                          ButtonTapEffect(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(text: newChangedCode ?? widget.codeText));
                            },
                            child: Container(
                              height: 53,
                              width: 53,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: themeData.colorScheme.primary,
                              ),
                              child: const Icon(Icons.copy_all_rounded, size: 28),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(height: 1, thickness: 1, color: themeData.colorScheme.outline),
                CodeTheme(
                  data: const CodeThemeData(styles: atomOneDarkTheme),
                  child: CodeField(
                    wrap: true,
                    horizontalScroll: true,
                    // maxLines: 20,
                    minLines: 1,
                    textSelectionTheme: const TextSelectionThemeData(),
                    lineNumberStyle: const LineNumberStyle(margin: 16),
                    background: DesignSystemColors.secondaryColorDark,
                    // controller: CodeController(
                    //   text: widget.codeText,
                    //   // language: javascript,
                    //   language: allLanguages[selectedLanguage],
                    // ),
                    onChanged: (newCode) {
                      setState(() {
                        newChangedCode = newCode;
                      });
                    },
                    controller: codeController,
                    textStyle: GoogleFonts.sourceCodePro(),
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
