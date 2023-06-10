import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class ExploreResourceCard extends StatelessWidget {
  const ExploreResourceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.resourceUrl,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String description;
  final String resourceUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: onTap,
      child: Container(
        height: 240,
        width: 220,
        padding: EdgeInsets.all(MySpaceSystem.spaceX3),
        decoration: BoxDecoration(
          boxShadow: cardShadow,
          borderRadius: BorderRadius.circular(8),
          color: themeData.colorScheme.secondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Icon(Icons.design_services),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 38,
                  height: 38,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      "http://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${resourceUrl}&size=128",
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.design_services),
                    ),
                  ),
                ),
                ButtonTapEffect(
                  child: Icon(Icons.open_in_new_rounded, color: themeData.colorScheme.primary),
                  onTap: () {
                    UtilityHelper.launchUrlNow(resourceUrl);
                  },
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: themeData.textTheme.titleMedium,
                ),
                SizedBox(height: MySpaceSystem.spaceX2),
                SizedBox(
                  child: Text(
                    description,
                    maxLines: 2,
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: MySpaceSystem.spaceX1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
