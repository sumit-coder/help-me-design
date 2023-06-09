import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_constants.dart';

class UtilityHelper {
  static launchUrlNow(String url) async {
    if (!await launchUrl(Uri.parse(url), webViewConfiguration: WebViewConfiguration(enableJavaScript: true))) {
      toastMessage(message: "Could not launch $url");
    }
  }

  static toastMessage({required String message, Duration? msgDuration}) {
    SnackBar snackBar = SnackBar(
      // shape: RoundedRectangleBorder(
      //     // borderRadius: BorderRadius.circular(100),
      //     ),
      elevation: 0,
      // behavior: SnackBarBehavior.floating,
      width: 404,
      behavior: SnackBarBehavior.floating,

      duration: msgDuration ?? Duration(milliseconds: 1500),
      backgroundColor: Colors.transparent,
      dismissDirection: DismissDirection.horizontal,
      content: Material(
        borderRadius: BorderRadius.circular(8),
        color: DesignSystemColors.secondaryColorDark,
        elevation: 4,
        child: Container(
          height: 54,
          padding: const EdgeInsets.only(left: 18, right: 18),
          alignment: Alignment.centerLeft,
          child: Text(
            message,
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.1,
            ),
          ),
        ),
      ),
    );
    if (message != 'N/A' && message != '') {
      scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    } else {
      // do something when message is empty but don't show snackBar
    }
  }
}
