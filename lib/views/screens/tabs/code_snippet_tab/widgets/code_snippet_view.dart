import 'package:flutter/material.dart';
import 'package:help_me_design/providers/snippet_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/code_editor/code_editor.dart';
import 'package:provider/provider.dart';

class CodeSnippetView extends StatelessWidget {
  const CodeSnippetView({
    super.key,
    required this.codeColor,
    required this.codeText,
  });

  final Color codeColor;
  final String codeText;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var snippetTabProvider = Provider.of<SnippetTabProvider>(context);
    return Column(
      children: [
        Container(
          height: 64,
          padding: EdgeInsets.all(MySpaceSystem.spaceX1),
          margin: EdgeInsets.only(left: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX3),
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
                  snippetTabProvider.changeCollectionView(false);
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
              Text("Flutter Code Snippets", style: themeData.textTheme.titleMedium)
            ],
          ),
        ),
        CodeEditor(codeColor: codeColor, codeText: codeText),
        CodeEditor(codeColor: codeColor, codeText: codeText),
      ],
    );
  }
}
