// import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/providers/snippet_tab_provider.dart';
import 'package:help_me_design/views/screens/tabs/code_snippet_tab/widgets/code_snippet_list_view.dart';
// import 'package:selectable_code_view/selectable_code_view.dart';

// Import the language & theme
import 'package:help_me_design/views/screens/tabs/code_snippet_tab/widgets/code_snippet_view.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_constants.dart';
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

  bool isOpenCodeSnippet = true;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    var snippetTabProvider = Provider.of<SnippetTabProvider>(context);
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
            AnimatedSwitcher(
              duration: 300.ms,
              switchInCurve: Curves.easeIn,
              child: snippetTabProvider.openActiveSnippetCollectionView
                  ? CodeSnippetView(codeColor: codeColor, codeText: codeText)
                  : CodeSnippetsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
