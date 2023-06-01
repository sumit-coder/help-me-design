import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/code_editor/code_editor.dart';
import 'package:help_me_design/views/widgets/tag_widget.dart';
import 'package:highlight/languages/d.dart';

class ComponentView extends StatelessWidget {
  ComponentView({Key? key}) : super(key: key);

  final List snippetCollectionList = [
    "def",
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

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 250,
            height: 500,
            child: SingleChildScrollView(
              child: Wrap(
                clipBehavior: Clip.antiAlias,
                children: [
                  for (var element in snippetCollectionList)
                    ButtonTapEffect(
                      margin: EdgeInsets.only(bottom: MySpaceSystem.spaceX2),
                      onTap: () {},
                      child: Container(
                        height: 64,
                        width: 300,
                        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.secondary,
                          boxShadow: cardShadow,
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'Flutter utility widgets',
                            maxLines: 2,
                            style: themeData.textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Column(
          //   children: [
          //     Container(
          //       height: 200,
          //       width: double.maxFinite,
          //       margin: EdgeInsets.only(left: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX2),
          //       padding: EdgeInsets.all(MySpaceSystem.spaceX2),
          //       decoration: BoxDecoration(
          //         color: themeData.colorScheme.secondary,
          //         boxShadow: cardShadow,
          //         borderRadius: const BorderRadius.all(Radius.circular(8)),
          //       ),
          //       child: Column(
          //         children: [
          //           Positioned(
          //             top: 8,
          //             left: 8,
          //             child: Text(
          //               'Preview',
          //               maxLines: 2,
          //               style: themeData.textTheme.titleSmall,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       height: 500,
          //       width: 300,
          //       child: CodeEditor(
          //         codeText: '''
          //                 Positioned(
          //                 top: 8,
          //                 left: 8,
          //                 child: Text(
          //                 'Preview',
          //                 maxLines: 2,
          //                 style: themeData.textTheme.titleSmall,
          //                 ),
          //                 ),

          //           ''',
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
