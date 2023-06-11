import 'package:flutter/material.dart';

import '../appwrite_service/databases_service.dart';
import '../theme/my_design_system.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Help Me Design",
                  style: MyTextTypeSystem.titleXXLargeDark.copyWith(fontSize: 54),
                ),
                SizedBox(height: MySpaceSystem.spaceX2),
                SizedBox(
                  width: 600,
                  child: Text(
                    "Help me Design App for to Help Developer Design and save there Reusable Code, Work in Progress",
                    style: MyTextTypeSystem.titleLargeDark,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    DatabasesService.get.componentsCollection();
                    // DatabasesService.add.componentsCollection();
                  },
                  child: Text(
                    "hy",
                    style: MyTextTypeSystem.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
