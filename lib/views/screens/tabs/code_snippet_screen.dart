import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selectable_code_view/selectable_code_view.dart';

import '../../../constants/text_constants.dart';
import '../../widgets/container_pattern_painter.dart';
import 'widgets/tab_view_hero_card.dart';

class CodeSnippetScreen extends StatelessWidget {
  CodeSnippetScreen({Key? key}) : super(key: key);

  final String codeText = '''
MaterialButton(
  child: Text("Click here"),
  onPressed: () {
    print("Clicked")
  },
),

const cars = ["BMW", "Volvo", "Mini"];

let text = "";
for (let x of cars) {
  text += x;
}

''';

  final String codeTextMd = '''
```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```

''';

  Color codeColor = Color(0xFF121212);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 200,
      // color: Colors.deepPurple,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // TabViewHeroCard(
            //   // title: MyTextConstants.docsTabHeadline,
            //   title: "Code Snippet.",
            //   shortDescription: MyTextConstants.docsTabShortDescription,
            //   posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
            //   bgPattern: ContainerSquarePatternTwoPainter(44, context),
            // ),

            SizedBox(height: 10),
            Container(
              height: 300,
              child: DartCodeViewer(
                codeText,
                showCopyButton: false,
                backgroundColor: codeColor,
              ),
            ),
            SizedBox(height: 10),
            SelectableCodeView(
              code: codeText, // Code text
              language: Language.JAVASCRIPT, // Language
              languageTheme: LanguageTheme.gravityDark(), // Theme
              fontSize: 16.0, // Font size
              withZoom: false, // Enable/Disable zoom icon controls
              withLinesCount: false, // Enable/Disable line number
              expanded: false, // Enable/Disable container expansion
            ),
          ],
        ),
      ),
    );
  }
}
