import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/simple_button.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/text_input_field.dart';

class AddComponentCollectionAlert extends StatelessWidget {
  const AddComponentCollectionAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
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
              Text('Add Component Collection', style: themeData.textTheme.titleMedium),
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
            emailEditingController: TextEditingController(),
            hintText: 'Collection title',
          ),
          SizedBox(height: MySpaceSystem.spaceX2),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                    child: TextInputField(
                  emailEditingController: TextEditingController(),
                  hintText: 'Tag 1',
                )),
                SizedBox(width: MySpaceSystem.spaceX2),
                Expanded(
                    child: TextInputField(
                  emailEditingController: TextEditingController(),
                  hintText: 'Tag 2 (Optional)',
                )),
              ],
            ),
          ),
          SizedBox(height: MySpaceSystem.spaceX3),
          SimpleButton(onTap: () {}, buttonTitle: "Add Collection")
        ],
      ),
    );
  }
}
