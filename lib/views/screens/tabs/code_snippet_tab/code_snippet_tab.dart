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
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            snippetTabProvider.openActiveSnippetCollectionView
                ? SizedBox()
                : TabViewHeroCard(
                    // title: MyTextConstants.docsTabHeadline,
                    title: "Code Snippet.",
                    shortDescription: MyTextConstants.docsTabShortDescription,
                    posterImage: "assets/images/snippets-poster.png",
                    bgPattern: SnippetsTabPatternPainter(44, context),
                  ),
            AnimatedSwitcher(
              duration: 300.ms,
              switchInCurve: Curves.easeIn,
              child: snippetTabProvider.openActiveSnippetCollectionView ? CodeSnippetView() : CodeSnippetsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
