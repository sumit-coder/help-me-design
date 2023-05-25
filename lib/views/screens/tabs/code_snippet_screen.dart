// import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
// import 'package:selectable_code_view/selectable_code_view.dart';

// Import the language & theme
import 'package:code_text_field/code_text_field.dart';

import '../../../constants/text_constants.dart';
import '../../widgets/code_editor/code_editor.dart';
import '../../widgets/container_pattern_painter.dart';
import 'widgets/tab_view_hero_card.dart';

class CodeSnippetScreen extends StatefulWidget {
  CodeSnippetScreen({Key? key}) : super(key: key);

  @override
  State<CodeSnippetScreen> createState() => _CodeSnippetScreenState();
}

class _CodeSnippetScreenState extends State<CodeSnippetScreen> {
  final String codeText = '''
MaterialButton(
  child: Text("Click here"),
  onPressed: () {
    print("Clicked")
  },
),

TabViewHeroCard(
  title: "Code Snippet.",
  shortDescription: MyTextConstants.docsTabShortDescription,
  posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
  bgPattern: ContainerSquarePatternTwoPainter(44, context),
),


function car(){
  return 'Hy!';
}

const cars = ["BMW", "Volvo", "Mini"];

let text = "";
for (let x of cars) {
  text += x;
}

''';

  Color codeColor = Color(0xFF121212);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      // margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 200,
      // height: 200,
      // color: Colors.deepPurple,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TabViewHeroCard(
              // title: MyTextConstants.docsTabHeadline,
              title: "Code Snippet.",
              shortDescription: MyTextConstants.docsTabShortDescription,
              posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
              bgPattern: ContainerSquarePatternTwoPainter(44, context),
            ),

            CodeEditor(codeColor: codeColor, codeText: codeText),

            // SizedBox(height: 10),
            // Container(
            //   height: 300,
            //   child: DartCodeViewer(
            //     codeText,
            //     showCopyButton: false,
            //     backgroundColor: codeColor,
            //   ),
            // ),
            // SizedBox(height: 10),
            // SelectableCodeView(
            //   code: codeText, // Code text
            //   language: Language.JAVASCRIPT, // Language
            //   languageTheme: LanguageTheme.gravityDark(), // Theme
            //   fontSize: 16.0, // Font size
            //   withZoom: false, // Enable/Disable zoom icon controls
            //   withLinesCount: false, // Enable/Disable line number
            //   expanded: false, // Enable/Disable container expansion
            // ),
          ],
        ),
      ),
    );
  }
}
