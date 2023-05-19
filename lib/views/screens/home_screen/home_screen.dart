import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:provider/provider.dart';

import '../../widgets/container_pattern_painter.dart';
import 'widgets/admin_view_sideBar.dart';
import 'widgets/sidebar_button.dart';

// save youtube videos
// save websites
//

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SideTabType activeButton = SideTabType.addQuizzes;

  @override
  Widget build(BuildContext context) {
    var themeMangerProvider = Provider.of<ThemeManager>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.maxFinite,
            height: size.height,
            constraints: BoxConstraints(maxWidth: 1200),
            margin: EdgeInsets.all(44),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              // color: Theme.of(context).colorScheme.secondary,
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      if (themeMangerProvider.isDarkMode) {
                        themeMangerProvider.changeThemeMode(ThemeMode.light);
                        setState(() {});
                        return;
                      }
                      themeMangerProvider.changeThemeMode(ThemeMode.dark);
                      setState(() {});

                      print(themeMangerProvider.getThemeMode);
                    },
                    icon: Icon(
                      Icons.dark_mode,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  AdminViewSideBar(
                    activeButtonType: activeButton,
                    onSideTabButtonChange: (SideTabType newTabChange) {
                      activeButton = newTabChange;
                      setState(() {});
                    },
                  ),
                  AnimatedSwitcher(
                    duration: 1000.ms,
                    child: Text('HY'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
