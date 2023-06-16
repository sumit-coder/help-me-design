import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_constants.dart';
import '../../../widgets/container_pattern_painter.dart';
import '../widgets/tab_view_hero_card.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var authService = Provider.of<AuthService>(context, listen: false);
    var themeMangerProvider = Provider.of<ThemeManager>(context, listen: false);
    return Container(
      // width: 200,
      // height: 200,
      // color: Colors.deepPurple,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TabViewHeroCard(
              // title: MyTextConstants.docsTabHeadline,
              title: "Settings.",
              shortDescription: "Setting, Profile, About",
              posterImage: 'assets/images/settings-poster.png',
              bgPattern: SettingsTabPatternPainter(54, context),
            ),
            SizedBox(height: MySpaceSystem.spaceX2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                SectionDividerWithTitle(
                  title: 'Profile',
                  bodyWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person_4, color: DesignSystemColors.secondaryColorDark, size: 78),
                          const SizedBox(width: MySpaceSystem.spaceX),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Default Name", style: MyTextTypeSystem.titleMediumDark),
                              const SizedBox(height: MySpaceSystem.spaceX),
                              authService.status == AuthStatus.authenticated
                                  ? Text(authService.currentUser.email, style: MyTextTypeSystem.titleLargeDark)
                                  : Text("example@gmail.com (Not Signed In)", style: MyTextTypeSystem.titleLargeDark),
                              // Text("currentUser@gmail.com (dummy email for demo)", style: MyTextTypeSystem.titleLargeDark),
                            ],
                          ),
                        ],
                      ),
                      if (authService.status == AuthStatus.authenticated)
                        ButtonTapEffect(
                          onTap: () {
                            authService.signOut();
                          },
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                              boxShadow: cardShadow,
                              color: DesignSystemColors.secondaryColorDark,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: MySpaceSystem.spaceX1),
                                Text("Logout", style: MyTextTypeSystem.titleMedium),
                                SizedBox(width: MySpaceSystem.spaceX1),
                                const Icon(Icons.logout_rounded, color: DesignSystemColors.secondaryColor, size: 34),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: MySpaceSystem.spaceX4),
                SectionDividerWithTitle(
                  title: 'Theme',
                  bodyWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ThemeModeCard(
                        isActive: themeData.brightness == Brightness.dark ? true : false,
                        title: 'Dark Mode',
                        mode: 'dark',
                        activeBorderColor: DesignSystemColors.secondaryColor,
                        modeColor: DesignSystemColors.secondaryColorDark,
                        onTap: () {
                          themeMangerProvider.changeThemeMode(ThemeMode.dark);
                        },
                      ),
                      SizedBox(width: MySpaceSystem.spaceX3),
                      ThemeModeCard(
                        isActive: themeData.brightness == Brightness.light ? true : false,
                        title: 'Light Mode',
                        mode: 'light',
                        activeBorderColor: DesignSystemColors.secondaryColorDark,
                        modeColor: DesignSystemColors.secondaryColor,
                        onTap: () {
                          themeMangerProvider.changeThemeMode(ThemeMode.light);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MySpaceSystem.spaceX3),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ThemeModeCard extends StatelessWidget {
  const ThemeModeCard({
    super.key,
    required this.title,
    required this.mode,
    required this.isActive,
    required this.activeBorderColor,
    required this.modeColor,
    required this.onTap,
  });

  final String title;
  final String mode;
  final bool isActive;
  final Color activeBorderColor;
  final Color modeColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ButtonTapEffect(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          boxShadow: cardShadow,
          color: modeColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: isActive ? activeBorderColor : modeColor),
        ),
        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: Image.asset(mode == 'dark' ? 'assets/images/dark.png' : 'assets/images/light.png'),
            ),
            SizedBox(height: MySpaceSystem.spaceX3),
            Text(title, style: mode == 'dark' ? MyTextTypeSystem.titleMedium : MyTextTypeSystem.titleMediumDark),
            SizedBox(height: MySpaceSystem.spaceX1),
          ],
        ),
      ),
    );
  }
}

class SectionDividerWithTitle extends StatelessWidget {
  const SectionDividerWithTitle({Key? key, required this.title, required this.bodyWidget}) : super(key: key);

  final String title;
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MySpaceSystem.spaceX3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextTypeSystem.titleXXLargeDark,
          ),
          SizedBox(height: MySpaceSystem.spaceX1),
          const Divider(height: 1, thickness: 1, color: DesignSystemColors.secondaryColorDark),
          SizedBox(height: MySpaceSystem.spaceX1),
          SizedBox(height: MySpaceSystem.spaceX3),
          bodyWidget,
        ],
      ),
    );
  }
}
