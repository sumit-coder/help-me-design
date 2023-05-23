import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

import '../../../constants/text_constants.dart';
import '../../widgets/container_pattern_painter.dart';
import 'widgets/tab_view_hero_card.dart';

class DocsView extends StatelessWidget {
  DocsView({Key? key}) : super(key: key);

  List<String> _items = ['q', 'm', '007', 'J', 'q', 'm'];

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
              // child: ScrollConfiguration(
              // behavior: ScrollConfiguration.of(context).copyWith(
              //   dragDevices: {
              //     PointerDeviceKind.touch,
              //     PointerDeviceKind.mouse,
              //   },
              // ),
              //   child: ListView.builder(
              //     // shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 10,
              //     itemBuilder: (context, index) {
              //       return TechCard(techName: "Flutter", onTap: () {});
              //     },
              //   ),
              // ),
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
                  for (var i in _items)
                    ButtonTapEffect(
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
                                borderRadius: BorderRadius.circular(4),
                                color: themeData.colorScheme.secondary,
                              ),
                              width: double.maxFinite,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  "https://i.ibb.co/pjzhF6F/nyt-puppeteer.jpg",
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 8),
                                padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX2),
                                decoration: BoxDecoration(
                                  boxShadow: cardShadow,
                                  borderRadius: BorderRadius.circular(4),
                                  color: themeData.colorScheme.secondary,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Youtube', maxLines: 1, style: themeData.textTheme.titleMedium),
                                        SizedBox(height: MySpaceSystem.spaceX1),
                                        Text('Youtube is for watching videos \nfor free',
                                            maxLines: 2, style: themeData.textTheme.bodyMedium),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.bookmark_add_rounded),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                : SizedBox(height: 24, child: Image.network('https://upload.wikimedia.org/wikipedia/commons/c/c6/Dart_logo.png')),
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