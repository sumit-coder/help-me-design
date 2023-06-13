import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/views/screens/tabs/components_tab/components_tab.dart';
import 'package:help_me_design/views/screens/tabs/inspiration_tab/inspiration_tab.dart';
import 'package:help_me_design/views/screens/tabs/settings_tab/settings_tab.dart';

import '../tabs/categories_screens.dart';
import '../tabs/code_snippet_tab/code_snippet_tab.dart';
import '../tabs/docs_tab/docs_tab.dart';
import '../tabs/explore_tab/explore_tab.dart';
import 'widgets/admin_view_sidebar.dart';

// save youtube videos
// save websites
//

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SideTabType activeButton = SideTabType.settings;

  Widget switchTabs(SideTabType newActiveTab) {
    switch (newActiveTab) {
      case SideTabType.explore:
        return ExploreView();
      case SideTabType.inspiration:
        return InspirationTab();
      // case SideTabType.docs:
      //   return DocsView();
      case SideTabType.codeSnippet:
        return CodeSnippetScreen();
      case SideTabType.components:
        return const ComponentsTab();
      case SideTabType.settings:
        return const SettingsTab();
      default:
        return const CategoriesView();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          // width: double.maxFinite,
          height: size.height,
          // clipBehavior: Clip.antiAlias,
          constraints: const BoxConstraints(maxWidth: 1200, minWidth: 1200),
          // margin: const EdgeInsets.all(44), //web
          margin: const EdgeInsets.all(22), // MObile
          // padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            // border: Border.all(width: 1, color: Colors.black54),
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
                    duration: 100.ms,
                    child: switchTabs(activeButton),
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
