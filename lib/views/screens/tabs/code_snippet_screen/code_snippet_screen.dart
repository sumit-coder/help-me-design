// import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
// import 'package:selectable_code_view/selectable_code_view.dart';

// Import the language & theme
import 'package:code_text_field/code_text_field.dart';

import '../../../../constants/text_constants.dart';
import '../../../../theme/my_theme.dart';
import '../../../widgets/button_tap_effect.dart';
import '../../../widgets/code_editor/code_editor.dart';
import '../../../widgets/container_pattern_painter.dart';
import '../widgets/tab_view_hero_card.dart';

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

  List snippetCollections = [
    "def",
    "def",
    "def",
    "def",
    "def",
    "def",
    "def",
    "def",
    "def",
  ];

  bool isOpenCodeSnippet = false;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabViewHeroCard(
              // title: MyTextConstants.docsTabHeadline,
              title: "Code Snippet.",
              shortDescription: MyTextConstants.docsTabShortDescription,
              posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
              bgPattern: ContainerSquarePatternTwoPainter(44, context),
            ),
            // CodeEditor(codeColor: codeColor, codeText: codeText),
            // CodeEditor(codeColor: codeColor, codeText: codeText),

            AnimatedSwitcher(
              duration: 500.ms,
              switchInCurve: Curves.decelerate,
              child: isOpenCodeSnippet
                  ? CodeSnippetVieWidget(codeColor: codeColor, codeText: codeText)
                  : CodeSnippetsListWidget(
                      onTapSnippetCollection: () {
                        setState(() {
                          isOpenCodeSnippet = true;
                        });
                      },
                      themeData: themeData,
                      snippetCollections: snippetCollections,
                    ),
            ),

            // CodeSnippetsListWidget(themeData: themeData, snippetCollections: snippetCollections)
          ],
        ),
      ),
    );
  }
}

class CodeSnippetVieWidget extends StatelessWidget {
  const CodeSnippetVieWidget({
    super.key,
    required this.codeColor,
    required this.codeText,
  });

  final Color codeColor;
  final String codeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CodeEditor(codeColor: codeColor, codeText: codeText),
        CodeEditor(codeColor: codeColor, codeText: codeText),
      ],
    );
  }
}

class CodeSnippetsListWidget extends StatelessWidget {
  const CodeSnippetsListWidget({
    super.key,
    required this.themeData,
    required this.snippetCollections,
    required this.onTapSnippetCollection,
  });

  final ThemeData themeData;
  final List snippetCollections;
  final VoidCallback onTapSnippetCollection;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      // width: 660,
      // height: 300,
      child: Wrap(
        spacing: MySpaceSystem.spaceX3,
        runSpacing: MySpaceSystem.spaceX3,
        // direction: Axis.vertical,
        children: [
          AddSnippetCard(themeData: themeData),
          for (var snippetCollection in snippetCollections)
            ButtonTapEffect(
              onTap: () {
                onTapSnippetCollection();
              },
              child: Container(
                height: 154,
                width: 300,
                padding: EdgeInsets.all(MySpaceSystem.spaceX2),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.secondary,
                  boxShadow: cardShadow,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.primary,
                            borderRadius: const BorderRadius.all(Radius.circular(2)),
                          ),
                          child: Text('Flutter', style: themeData.textTheme.bodyMedium),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flutter utility widgets',
                          maxLines: 2,
                          style: themeData.textTheme.titleSmall,
                        ),
                        SizedBox(height: MySpaceSystem.spaceX2),
                        Text('20 Snippets', style: themeData.textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AddSnippetCard extends StatelessWidget {
  const AddSnippetCard({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return ButtonTapEffect(
      onTap: () {},
      child: Material(
        elevation: 3,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          height: 150,
          width: 300,
          // padding: EdgeInsets.all(MySpaceSystem.spaceX2),
          decoration: BoxDecoration(
            boxShadow: cardShadow,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: DesignSystemColors.primaryColorDark,
            // border: Border.all(width: 1, color: themeData.colorScheme.outline),
          ),
          child: DottedBorder(
            color: themeData.colorScheme.outline,
            radius: Radius.circular(8),
            borderType: BorderType.RRect,
            strokeWidth: 2,
            dashPattern: [5, 4],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_rounded,
                    size: 44,
                    color: themeData.colorScheme.secondary,
                  ),
                  SizedBox(height: MySpaceSystem.spaceX2),
                  Text(
                    'Snippet Collection',
                    style: themeData.textTheme.bodyMedium!.copyWith(
                      color: themeData.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
