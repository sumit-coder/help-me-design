import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/appwrite_constants_all.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';
import 'package:help_me_design/appwrite_service/storage_service.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/code_editor/code_editor.dart';
import 'package:help_me_design/views/widgets/send_back_bar_with_title.dart';
import 'package:provider/provider.dart';

import 'add_component_alert.dart';
import 'cards/add_component_card.dart';
import 'cards/component_card.dart';

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
    var componentTabProvider = Provider.of<ComponentTabProvider>(context, listen: true);

    var activeCollectionData = componentTabProvider.activeCollectionComponentsData;
    var activeComponentIndex = componentTabProvider.activeComponentViewIndex;
    return Container(
      // margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      child: Column(
        children: [
          SendBackBarWithTitle(
            title: componentTabProvider.componentsCollectionData[componentTabProvider.activeComponentCollectionIndex].data['title'],
            onTap: () {
              // snippetTabProvider.changeCollectionView(false);
              componentTabProvider.changeOpenActiveComponentCollectionView(false, -1);
              componentTabProvider.makeActiveCollectionDataEmpty();
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
                                setState(() {});
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
                            // height: 154,
                            constraints: BoxConstraints(minHeight: 154, maxHeight: 300),
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
                                activeCollectionData.isEmpty
                                    ? SizedBox()
                                    : activeCollectionData[activeComponentIndex].data['previewFileId'] == null
                                        ?
                                        // Component Preview
                                        Container(
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: ButtonTapEffect(
                                                onTap: () async {
                                                  onTapAddPreviewImage(componentTabProvider);
                                                },
                                                child: Container(
                                                  height: 53,
                                                  width: 188,
                                                  padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX2),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: themeData.colorScheme.outline.withOpacity(0.4),
                                                  ),
                                                  child: Center(
                                                    child: Text("Add Preview Image", style: themeData.textTheme.titleSmall),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: Image.network(
                                              "https://cloud.appwrite.io/v1/storage/buckets/${AppWriteConst.usersComponentsPreviewFilesBucketId}/files/${activeCollectionData[activeComponentIndex].data['previewFileId']}/view?project=${AppWriteConst.APPWRITE_PROJECT_ID}",
                                              errorBuilder: (context, error, stackTrace) => Icon(Icons.error_rounded),
                                            ),
                                          )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              for (var i = 0; i < activeCollectionData.length; i++)
                                Visibility(
                                  visible: i == componentTabProvider.activeComponentViewIndex ? true : false,
                                  child: CodeEditor(
                                    onTapUpdateButton: ({newCode, newLanguage}) async {
                                      var updateResponse = await DatabasesService.update.component(
                                        componentId: activeCollectionData[componentTabProvider.activeComponentViewIndex].$id,
                                        code: newCode,
                                        codeLanguage: newLanguage,
                                        previewType: null,
                                        previewUrl: null,
                                        previewFileId: null,
                                      );
                                      if (updateResponse) {
                                        componentTabProvider.getActiveCollectionComponentsData();
                                        UtilityHelper.toastMessage(message: "Code Updated");
                                      }
                                    },
                                    codeText: activeCollectionData[i].data['code'],
                                    description: '',
                                    title: activeCollectionData[i].data['title'],
                                    codeLanguage: activeCollectionData[i].data['codeLanguage'],
                                  ),
                                )
                            ],
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

  onTapAddPreviewImage(ComponentTabProvider componentTabProvider) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      // print(byt);
      var bytes = result.files.first.bytes!.toList();

      var fileResponse = await StorageService.upload.uploadComponentsPreviewFile(bytes, result.files.first.name);

      if (fileResponse != null) {
        log(fileResponse.$id);
        var addResponse = await DatabasesService.update.component(
          code: null,
          codeLanguage: null,
          previewUrl: null,
          previewType: 'img',
          previewFileId: fileResponse.$id,
          componentId: componentTabProvider.activeCollectionComponentsData[componentTabProvider.activeComponentViewIndex].$id,
        );

        if (addResponse) {
          componentTabProvider.getActiveCollectionComponentsData();
          UtilityHelper.toastMessage(message: "Code Updated");
        }
      }
    }
  }
}
