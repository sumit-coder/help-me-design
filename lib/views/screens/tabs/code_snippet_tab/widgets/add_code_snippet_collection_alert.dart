import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';
import 'package:help_me_design/providers/snippet_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/simple_button.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/text_input_field.dart';
import 'package:provider/provider.dart';

class AddCodeSnippetCollectionAlert extends StatelessWidget {
  AddCodeSnippetCollectionAlert({Key? key}) : super(key: key);

  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _tagEditingController = TextEditingController();
  final TextEditingController _tagTwoEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var authProvider = Provider.of<AuthService>(context);
    var snippetTabProvider = Provider.of<SnippetTabProvider>(context);
    return Container(
      padding: EdgeInsets.all(MySpaceSystem.spaceX4),
      width: 404,
      // height: 500,
      decoration: BoxDecoration(
        color: themeData.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add Snippet Collection', style: themeData.textTheme.titleMedium),
              ButtonTapEffect(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.clear_rounded),
              ),
            ],
          ),
          SizedBox(height: MySpaceSystem.spaceX4),
          TextInputField(
            emailEditingController: _titleEditingController,
            hintText: 'Collection title',
          ),
          SizedBox(height: MySpaceSystem.spaceX2),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                    child: TextInputField(
                  emailEditingController: _tagEditingController,
                  hintText: 'Tag 1',
                )),
                SizedBox(width: MySpaceSystem.spaceX2),
                Expanded(
                    child: TextInputField(
                  emailEditingController: _tagTwoEditingController,
                  hintText: 'Tag 2 (Optional)',
                )),
              ],
            ),
          ),
          SizedBox(height: MySpaceSystem.spaceX3),
          SimpleButton(
            onTap: () async {
              if (_titleEditingController.text.isEmpty || _tagEditingController.text.isEmpty) return;

              // added database
              var addResponse = await DatabasesService.add.snippetsCollection(
                userId: authProvider.currentUser.$id,
                title: _titleEditingController.text.trim(),
                tags: _tagTwoEditingController.text.isNotEmpty
                    ? '${_tagEditingController.text},${_tagTwoEditingController.text}'
                    : _tagEditingController.text.trim(),
              );
              Navigator.pop(context);
              // adding is successful then get new data back and show
              if (addResponse) {
                snippetTabProvider.getSnippetsData(authProvider.currentUser.$id);
              }
            },
            buttonTitle: "Add Collection",
          )
        ],
      ),
    );
  }
}
