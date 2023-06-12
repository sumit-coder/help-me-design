import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/appwrite_constants_all.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';
import 'package:help_me_design/appwrite_service/storage_service.dart';
import 'package:help_me_design/providers/inspiration_tab_provider/inspiration_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:provider/provider.dart';

class InspirationsListView extends StatelessWidget {
  const InspirationsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    var inspirationTabProvider = Provider.of<InspirationTabProvider>(context);
    return Container(
      margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: MySpaceSystem.spaceX3,
        runSpacing: MySpaceSystem.spaceX3,
        children: [
          AddInspirationCard(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png', 'doc'],
              );
              if (result != null) {
                var bytes = result.files.first.bytes!.toList();

                var fileResponse = await StorageService().uploadInspirationsFile(bytes, result.files.first.name);

                if (fileResponse != null) {
                  var addResponse = await DatabasesService.add.inspirationsFileInfo(
                    fileUrl: '',
                    userId: authService.currentUser.$id,
                    fileTitle: fileResponse.name,
                    fileType: fileResponse.signature,
                    fileId: fileResponse.$id,
                  );

                  if (addResponse) {
                    inspirationTabProvider.getCurrentUsersInspirationsData(authService.currentUser.$id);
                  }
                }
              }
              // print(result!.files.first.size);
            },
          ),
          for (var i = 0; i < inspirationTabProvider.listOfCurrentUserInspirations.length; i++)
            InspirationCard(
              onTap: () {},
              imageUrl:
                  "https://cloud.appwrite.io/v1/storage/buckets/${AppWriteConst.usersInspirationFilesBucketId}/files/${inspirationTabProvider.listOfCurrentUserInspirations[i].data['fileId']}/view?project=${AppWriteConst.APPWRITE_PROJECT_ID}",
            )
        ],
      ),
    );
  }
}
// https://cloud.appwrite.io/v1/storage/buckets/648767889784e9d8ae81/files/648774e4cbb5d98a135d/preview?project=64803e0044c9826d779b&width=500&height=600

class InspirationCard extends StatelessWidget {
  const InspirationCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
  });

  final VoidCallback onTap;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: onTap,
      child: Container(
        height: 350,
        width: 300,
        padding: EdgeInsets.all(MySpaceSystem.spaceX),
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
          boxShadow: cardShadow,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddInspirationCard extends StatelessWidget {
  const AddInspirationCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: onTap,
      child: Material(
        elevation: 3,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          height: 348,
          width: 300,
          // padding: EdgeInsets.all(MySpaceSystem.spaceX2),
          decoration: BoxDecoration(
            boxShadow: cardShadow,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: themeData.colorScheme.primary,
            // border: Border.all(width: 1, color: themeData.colorScheme.outline),
          ),
          child: DottedBorder(
            color: themeData.colorScheme.outline,
            radius: Radius.circular(8),
            borderType: BorderType.RRect,
            strokeWidth: 2,
            dashPattern: const [5, 4],
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
                    'Add Inspiration Image',
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
