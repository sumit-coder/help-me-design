import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';

class ExploreView extends StatelessWidget {
  ExploreView({Key? key}) : super(key: key);

  List<String> _items = ['q', 'm', '007', 'J', 'q', 'm'];

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX3),
          decoration: BoxDecoration(
            boxShadow: cardShadow,
            borderRadius: BorderRadius.circular(8),
            color: themeData.colorScheme.secondary,
          ),
          width: 630,
          height: 200,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 300,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                    child: Image.network(
                      "https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png",
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: MySpaceSystem.spaceX3,
                bottom: MySpaceSystem.spaceX3,
                child: SizedBox(
                  width: 300,
                  child: RichText(
                    text: TextSpan(
                      text: 'Explore\n',
                      style: MyTextTypeSystem.titleXXLargeDark.copyWith(fontSize: 34, height: 1.0),
                      children: [
                        TextSpan(
                          text: '\n',
                          style: MyTextTypeSystem.titleMedium,
                        ),
                        TextSpan(
                          text:
                              'Welcome to HelpMeDesign, Here you can Explore, Add & Create. Design Resources, Design Systems, UI Components, ',
                          style: MyTextTypeSystem.titleMediumDark.copyWith(height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
          width: 660,
          child: Wrap(
            spacing: MySpaceSystem.spaceX3,
            runSpacing: MySpaceSystem.spaceX3,
            // direction: Axis.vertical,
            children: [
              for (var i in _items)
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    boxShadow: cardShadow,
                    borderRadius: BorderRadius.circular(8),
                    color: themeData.colorScheme.secondary,
                  ),
                  child: Text('adf'),
                ),
            ],
          ),
        )
      ],
    );
  }
}
