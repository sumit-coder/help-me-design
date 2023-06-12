import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/code_editor/code_editor.dart';
import 'package:help_me_design/views/widgets/send_back_bar_with_title.dart';
import 'package:provider/provider.dart';

import 'add_component_alert.dart';

class ComponentView extends StatefulWidget {
  ComponentView({Key? key}) : super(key: key);

  @override
  State<ComponentView> createState() => _ComponentViewState();
}

class _ComponentViewState extends State<ComponentView> {
  final List snippetCollectionList = [
    "def",
    "def",
  ];

  final int activeComponentViewIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    var componentTabProvider = Provider.of<ComponentTabProvider>(context, listen: false);
    componentTabProvider.getActiveCollectionComponentsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var componentTabProvider = Provider.of<ComponentTabProvider>(context);
    return Container(
      // margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      child: Column(
        children: [
          SendBackBarWithTitle(
            title: "Flutter Code Snippets",
            onTap: () {
              // snippetTabProvider.changeCollectionView(false);
              componentTabProvider.changeOpenActiveComponentCollectionView(false, -1);
            },
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
                    width: 250,
                    // height: 500,
                    child: SingleChildScrollView(
                      child: Wrap(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          AddComponentCard(
                            onTap: () {
                              UtilityHelper.showAlertMyDialog(
                                context: context,
                                bodyWidget: AddComponentAlert(),
                              );
                            },
                          ),
                          for (var i = 0; i < componentTabProvider.activeCollectionComponentsData.length; i++)
                            ComponentCard(
                              isActive: componentTabProvider.activeComponentViewIndex == i,
                              onTap: () {
                                componentTabProvider.changeActiveComponentViewIndex(i);
                              },
                              title: componentTabProvider.activeCollectionComponentsData[i].data['title'],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
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

           Positioned(
           top: 8,
           left: 8,
           child: Text(
           'Preview',
           maxLines: 2,
           style: themeData.textTheme.titleSmall,
           ),
           ),

           Positioned(
           top: 8,
           left: 8,
           child: Text(
           'Preview',
           maxLines: 2,
           style: themeData.textTheme.titleSmall,
           ),
           ),

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
                            description: '',
                            title: '',
                            codeLanguage: '',
                          ),
                        ],
                      ),
                    ),
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

class AddComponentCard extends StatelessWidget {
  const AddComponentCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      margin: EdgeInsets.only(bottom: MySpaceSystem.spaceX2 + 4),
      onTap: onTap,
      child: Container(
        height: 64,
        width: 300,
        padding: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          boxShadow: cardShadow,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: DottedBorder(
          // color: themeData.colorScheme.primary,
          color: themeData.colorScheme.outline,
          radius: const Radius.circular(8),
          borderType: BorderType.RRect,
          strokeWidth: 2,
          dashPattern: const [5, 4],
          padding: EdgeInsets.all(MySpaceSystem.spaceX2),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add_rounded, color: themeData.colorScheme.secondary),
                SizedBox(width: MySpaceSystem.spaceX1),
                Text(
                  'Component',
                  maxLines: 2,
                  style: themeData.textTheme.titleSmall!.copyWith(
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

class ComponentCard extends StatelessWidget {
  const ComponentCard({
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
                : const SizedBox(),
            Center(
              child: Text(
                title,
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
