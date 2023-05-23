import 'package:flutter/material.dart';

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
        height: 250,
        width: 300,
        color: themeData.colorScheme.primary,
        // padding: EdgeInsets.all(MySpaceSystem.spaceX2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 144,
              decoration: BoxDecoration(
                boxShadow: cardShadow,
                borderRadius: BorderRadius.circular(8),
                color: themeData.colorScheme.secondary,
              ),
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 6),
                padding: EdgeInsets.only(left: MySpaceSystem.spaceX2, right: MySpaceSystem.spaceX2),
                decoration: BoxDecoration(
                  boxShadow: cardShadow,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: themeData.colorScheme.secondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: themeData.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.open_in_new_rounded,
                            // Icons.bookmark_add_rounded,
                            color: DesignSystemColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: MySpaceSystem.spaceX),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_added_rounded,
                            // Icons.bookmark_add_rounded,
                            color: DesignSystemColors.primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
