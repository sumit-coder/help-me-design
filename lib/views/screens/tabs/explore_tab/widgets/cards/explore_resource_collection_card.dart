import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class ExploreResourceCollectionCard extends StatelessWidget {
  const ExploreResourceCollectionCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.popularResourceUrl,
      required this.resourcesCount,
      required this.onTap})
      : super(key: key);

  final String title;
  final String description;
  final String popularResourceUrl;
  final String resourcesCount;
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
            SizedBox(
              width: 38,
              height: 38,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  "http://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${popularResourceUrl}&size=128",
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.design_services),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: themeData.textTheme.titleMedium,
                ),
                SizedBox(height: MySpaceSystem.spaceX2),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.bodyMedium,
                ),
                SizedBox(height: MySpaceSystem.spaceX2),
                Text(
                  'Count: $resourcesCount',
                  style: themeData.textTheme.bodySmall,
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
