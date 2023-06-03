import 'package:flutter/material.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/code_editor/code_editor.dart';
import 'package:help_me_design/views/widgets/tag_widget.dart';
import 'package:highlight/languages/d.dart';
import 'package:provider/provider.dart';

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

  final int activeComponentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var componentTabProvider = Provider.of<ComponentTabProvider>(context);
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
                  for (var i = 0; i < snippetCollectionList.length; i++)
                    ComponentInfoCard(
                      isActive: componentTabProvider.activeComponentViewIndex == i,
                      onTap: () {
                        componentTabProvider.changeActiveComponentViewIndex(i);
                      },
                      title: '',
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 154,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX2),
                      padding: EdgeInsets.all(MySpaceSystem.spaceX2),
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.secondary,
                        boxShadow: cardShadow,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: MySpaceSystem.spaceX2,
                            top: MySpaceSystem.spaceX2,
                            child: Text(
                              'Preview',
                              maxLines: 2,
                              style: themeData.textTheme.titleSmall,
                            ),
                          ),
                          // Component Preview
                          Container(),
                        ],
                      ),
                    ),
                    const CodeEditor(
                      codeText: '''
 Positioned(
 top: 8,
 left: 8,
 child: Text(
 'Preview',
 maxLines: 2,
 style: themeData.textTheme.titleSmall,
 ),
 ),
                    
                        ''',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ComponentInfoCard extends StatelessWidget {
  const ComponentInfoCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.isActive,
  });

  final VoidCallback onTap;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      margin: EdgeInsets.only(bottom: MySpaceSystem.spaceX2),
      onTap: () {
        onTap();
      },
      child: Container(
        height: 64,
        width: 300,
        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
          boxShadow: cardShadow,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            isActive
                ? Positioned(
                    child: Icon(
                      Icons.circle_rounded,
                      color: themeData.colorScheme.primary,
                      size: 8,
                    ),
                  )
                : SizedBox(),
            Center(
              child: Text(
                'Flutter utility widgets',
                maxLines: 2,
                style: themeData.textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
