import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/screens/tabs/components_tab/components_tab.dart';
import 'package:help_me_design/views/screens/tabs/inspiration_tab/inspiration_tab.dart';
import 'package:help_me_design/views/screens/tabs/saved_tab/saved_tab.dart';
import 'package:help_me_design/views/screens/tabs/settings_tab/settings_tab.dart';
import 'package:provider/provider.dart';

import '../tabs/code_snippet_tab/code_snippet_tab.dart';
import '../tabs/explore_tab/explore_tab.dart';
import 'widgets/admin_view_sidebar.dart';
import 'widgets/sign_in_alert_card.dart';

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

  Widget switchTabs(SideTabType newActiveTab) {
    switch (newActiveTab) {
      case SideTabType.explore:
        return const ExploreView();

      case SideTabType.inspiration:
        return const InspirationTab();

      case SideTabType.components:
        return const ComponentsTab();

      case SideTabType.codeSnippet:
        return CodeSnippetScreen();

      case SideTabType.saved:
        return const SavedDesignResourceTab();

      case SideTabType.settings:
        return const SettingsTab();

      default:
        return const ExploreView();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          constraints: const BoxConstraints(maxWidth: 1200, minWidth: 1200),
          margin: const EdgeInsets.all(22), // MObile
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdminViewSideBar(
                  activeButtonType: activeButton,
                  onSideTabButtonChange: (SideTabType newTabChange) {
                    // if user is not logged in then only let him see explore and settings sections
                    if (newTabChange == SideTabType.explore || newTabChange == SideTabType.settings) {
                      activeButton = newTabChange;
                      setState(() {});
                      return;
                    }
                    // if user is logged in then let him see everything
                    if (authService.status == AuthStatus.authenticated) {
                      activeButton = newTabChange;
                      setState(() {});
                      return;
                    }
                    // else show him alert for SignIn
                    UtilityHelper.showAlertMyDialog(
                      context: context,
                      bodyWidget: SignInAlertCard(),
                    );
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
