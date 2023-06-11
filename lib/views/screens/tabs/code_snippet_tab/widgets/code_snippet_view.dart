import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/providers/snippet_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/screens/tabs/code_snippet_tab/widgets/add_code_snippet_alert.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/code_editor/code_editor.dart';
import 'package:help_me_design/views/widgets/send_back_bar_with_title.dart';
import 'package:provider/provider.dart';

class CodeSnippetView extends StatelessWidget {
  const CodeSnippetView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var snippetTabProvider = Provider.of<SnippetTabProvider>(context);
    return Column(
      children: [
        SendBackBarWithTitle(
          title: "Flutter Code Snippets",
          onTap: () {
            snippetTabProvider.changeCollectionView(false);
          },
        ),
        SizedBox(height: MySpaceSystem.spaceX2),
        AddCodeSnippetCard(
          onTap: () {
            UtilityHelper.showAlertMyDialog(
              context: context,
              bodyWidget: AddCodeSnippetAlert(),
            );
          },
        ),
        SizedBox(height: MySpaceSystem.spaceX3),
        CodeEditor(codeText: codeText2),
        CodeEditor(codeText: codeText),
      ],
    );
  }
}

class AddCodeSnippetCard extends StatelessWidget {
  const AddCodeSnippetCard({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: onTap,
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      child: DottedBorder(
        color: themeData.colorScheme.outline,
        radius: Radius.circular(8),
        borderType: BorderType.RRect,
        strokeWidth: 2,
        // padding: EdgeInsets.all(0.5),
        dashPattern: const [5, 4],
        child: Container(
          height: 54,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            // boxShadow: cardShadow,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_rounded,
                  size: 34,
                  color: themeData.colorScheme.secondary,
                ),
                SizedBox(width: MySpaceSystem.spaceX2),
                Text(
                  'Snippet Collection',
                  style: themeData.textTheme.bodyLarge!.copyWith(
                    color: themeData.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final String codeText2 = '''
MaterialButton(
  child: Text("Click here"),
  onPressed: () {
    print("Clicked")
  },
),
''';

final String codeText = '''
MaterialButton(
  child: Text("Click here"),
  onPressed: () {
    print("Clicked")
  },
),


f

// TabViewHeroCard(
//   title: "Code Snippet.",
//   shortDescription: MyTextConstants.docsTabShortDescription,
//   posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
//   bgPattern: ContainerSquarePatternTwoPainter(44, context),
// ),

// function car(){
//   return 'Hy!';
// }

// const cars = ["BMW", "Volvo", "Mini"];

// let text = "";
// for (let x of cars) {
//   text += x;
// }

// ''';
