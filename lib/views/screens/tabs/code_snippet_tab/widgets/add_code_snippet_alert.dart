import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';
import 'package:help_me_design/providers/snippet_tab_provider/snippet_tab_provider.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/simple_button.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/text_input_field.dart';
import 'package:provider/provider.dart';

class AddCodeSnippetAlert extends StatelessWidget {
  AddCodeSnippetAlert({Key? key}) : super(key: key);

  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
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
              Text('Add Snippet', style: themeData.textTheme.titleMedium),
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
            hintText: 'Snippet title',
          ),
          SizedBox(height: MySpaceSystem.spaceX2),
          TextInputField(
            maxLines: 3,
            emailEditingController: _descriptionEditingController,
            hintText: 'Snippet Description',
          ),
          SizedBox(height: MySpaceSystem.spaceX3),
          SimpleButton(
            onTap: () async {
              if (_titleEditingController.text.isEmpty || _descriptionEditingController.text.isEmpty) return;

              var addResponse = await DatabasesService.add.snippets(
                collectionId: snippetTabProvider.snippetsCollectionData[snippetTabProvider.indexOfClickedSnippetCollection].$id,
                title: _titleEditingController.text,
                description: _descriptionEditingController.text,
              );
              Navigator.pop(context);

              if (addResponse) {
                snippetTabProvider.getActiveSnippetsCollectionData();
              }
            },
            buttonTitle: "Add Snippet",
          )
        ],
      ),
    );
  }
}
