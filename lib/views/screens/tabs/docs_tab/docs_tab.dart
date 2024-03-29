import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

import '../../../../constants/text_constants.dart';
import '../../../widgets/container_pattern_painter.dart';
import '../widgets/tab_view_hero_card.dart';
import '../widgets/website_card.dart';

class DocsView extends StatelessWidget {
  DocsView({Key? key}) : super(key: key);

  List<String> _items = ['q', 'm', '007', 'J', 'q', 'm', 'J', 'q', 'm'];

  int constants = 0;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Container(
      alignment: Alignment.topCenter,
      // color: Colors.red,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabViewHeroCard(
              bgPattern: ContainerSquarePatternTwoPainter(44, context),
              posterImage: 'https://i.ibb.co/SNVPkKM/original-dd50f8430ab324b03b6af592e73ca6c7-removebg-preview.png',
              shortDescription: MyTextConstants.docsTabShortDescription,
              title: MyTextConstants.docsTabHeadline,
            ),
            Container(
              height: 58,
              width: double.maxFinite,
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(6),
              margin: EdgeInsets.only(left: MySpaceSystem.spaceX3, bottom: MySpaceSystem.spaceX3),
              decoration: BoxDecoration(
                boxShadow: cardShadow,
                borderRadius: BorderRadius.circular(8),
                color: themeData.colorScheme.secondary,
              ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TechCard(techName: "Saved", icon: Icons.bookmark_added_rounded, onTap: () {}),
                      for (var i = 0; i < 3; i++) TechCard(techName: "Javascript", onTap: () {}),
                      TechCard(techName: "Dart", onTap: () {}),
                      TechCard(techName: "Flutter", onTap: () {}),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: MySpaceSystem.spaceX3),
              // width: 660,
              // height: 300,
              child: Wrap(
                spacing: MySpaceSystem.spaceX3,
                runSpacing: MySpaceSystem.spaceX3,
                // direction: Axis.vertical,
                children: [
                  AddDocCard(themeData: themeData),
                  for (var i in _items)
                    const WebsiteCard(
                      title: 'Youtube-can-be-website.com',
                      shortDescription: 'Youtube is for watching videos \nfor free adasd asd fefad faeasd fa ea3',
                      imageUrl: 'https://i.ibb.co/Rhkgs3q/nyt-puppeteer.jpg',
                      websiteUrl: 'https://youtube.com',
                      isBookmarked: false,
                    ),
                ],
              ),
            )
          ],
        ).animate().scaleXY(begin: 0.1).move(begin: const Offset(-250, 300)).flipH(begin: -0.1),
      ),
    );
  }
}

class TechCard extends StatelessWidget {
  const TechCard({
    super.key,
    required this.techName,
    required this.onTap,
    this.icon,
  });

  final String techName;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ButtonTapEffect(
      onTap: () {},
      child: Container(
        // height: 54,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          boxShadow: cardShadow,
          borderRadius: BorderRadius.circular(4),
          color: themeData.colorScheme.primary,
        ),
        child: Row(
          children: [
            icon != null
                ? SizedBox(
                    child: Icon(
                      icon,
                      size: 28,
                      color: DesignSystemColors.secondaryColorDark,
                    ),
                  )
                : SizedBox(
                    height: 24,
                    child: Image.network('https://upload.wikimedia.org/wikipedia/commons/c/c6/Dart_logo.png'),
                  ),
            SizedBox(width: MySpaceSystem.spaceX2),
            Text(techName, style: MyTextTypeSystem.titleLargeDark),
          ],
        ),
      ),
    );
  }
}

// https://i.ibb.co/pjzhF6F/nyt-puppeteer.jpg
// https://www.rockstargames.com/favicon.ico

class AddDocCard extends StatelessWidget {
  const AddDocCard({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return ButtonTapEffect(
      onTap: () {},
      child: Material(
        elevation: 3,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          height: 298,
          width: 300,
          // padding: EdgeInsets.all(MySpaceSystem.spaceX2),
          decoration: BoxDecoration(
            boxShadow: cardShadow,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: DesignSystemColors.primaryColorDark,
            // border: Border.all(width: 1, color: themeData.colorScheme.outline),
          ),
          child: DottedBorder(
            color: themeData.colorScheme.outline,
            radius: Radius.circular(8),
            borderType: BorderType.RRect,
            strokeWidth: 2,
            dashPattern: [5, 4],
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
                    'Documentation',
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
