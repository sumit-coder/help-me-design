import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:provider/provider.dart';

import '../../widgets/container_pattern_painter.dart';
import '../tabs/explore_screen.dart';
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
  SideTabType activeButton = SideTabType.explore;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          // width: double.maxFinite,
          height: size.height,
          constraints: BoxConstraints(maxWidth: 1200, minWidth: 1200),
          margin: EdgeInsets.all(44),
          // padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black54),
            borderRadius: BorderRadius.circular(24),
            // color: Theme.of(context).colorScheme.secondary,
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdminViewSideBar(
                  activeButtonType: activeButton,
                  onSideTabButtonChange: (SideTabType newTabChange) {
                    activeButton = newTabChange;
                    setState(() {});
                  },
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: 1000.ms,
                    child: ExploreView(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
