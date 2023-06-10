import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_colors.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/email_input_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_constants.dart';

class UtilityHelper {
  static launchUrlNow(String url) async {
    if (!await launchUrl(Uri.parse(url), webViewConfiguration: const WebViewConfiguration(enableJavaScript: true))) {
      toastMessage(message: "Could not launch $url");
    }
  }

  static showAlertMyDialog({
    required BuildContext context,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      barrierColor: const Color.fromARGB(204, 98, 91, 117),
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(24),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                // width: 400,
                // height: 500,
                decoration: BoxDecoration(color: Colors.black),
                child: Column(
                  children: [
                    EmailInputField(emailEditingController: TextEditingController()),
                    EmailInputField(emailEditingController: TextEditingController()),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
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
      duration: msgDuration ?? const Duration(milliseconds: 1500),
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
