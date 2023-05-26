import 'package:flutter/material.dart';
import 'package:help_me_design/views/widgets/tag_widget.dart';

import '../../../../theme/my_colors.dart';
import '../../../../theme/my_design_system.dart';
import '../../../../theme/my_theme.dart';
import '../../../widgets/button_tap_effect.dart';

class WebsiteCard extends StatelessWidget {
  const WebsiteCard({
    super.key,
    required this.title,
    required this.shortDescription,
    required this.imageUrl,
    required this.websiteUrl,
    required this.isBookmarked,
    this.onTap,
  });

  final String title;
  final String shortDescription;
  final String imageUrl;
  final String websiteUrl;
  final bool isBookmarked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: () {},
      child: Container(
        height: 300,
        width: 300,
        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
        decoration: BoxDecoration(
          boxShadow: cardShadow,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: themeData.colorScheme.secondary,
        ),
        // padding: EdgeInsets.all(MySpaceSystem.spaceX2),
        child: Stack(
          children: [
            SizedBox(
              height: 54,
              width: 54,
              child: ClipRRect(
                child: Image.network("https://i.ibb.co/wL7nkQb/favicon-V2.png"),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.open_in_new_rounded,
                      // Icons.bookmark_add_rounded,
                      color: DesignSystemColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: MySpaceSystem.spaceX1),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_added_rounded,
                      // Icons.bookmark_add_rounded,
                      color: DesignSystemColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              // left: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: themeData.textTheme.titleMedium,
                  ),
                  SizedBox(height: MySpaceSystem.spaceX1),
                  Text(
                    shortDescription,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: themeData.textTheme.bodyMedium,
                  ),
                  SizedBox(height: MySpaceSystem.spaceX3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "stakeoverflow.com",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: themeData.textTheme.bodySmall,
                      ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      //   decoration: BoxDecoration(
                      //     color: themeData.colorScheme.onSecondary,
                      //     borderRadius: const BorderRadius.all(Radius.circular(4)),
                      //   ),
                      //   child: Text(
                      //     'Dart',
                      //     overflow: TextOverflow.ellipsis,
                      //     style: themeData.textTheme.bodyMedium,
                      //   ),
                      // ),
                      const Tag(title: 'Dart'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
