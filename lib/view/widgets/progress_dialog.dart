import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialog {
  static void showProgressDialog() {
    AlertDialog alert = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(child: CircularProgressIndicator()),
    );
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: alert);
      },
    );
  }
}
