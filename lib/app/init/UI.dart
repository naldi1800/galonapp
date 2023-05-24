import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UI {
  static Color background = const Color(0xff181920);
  static Color foreground = const Color(0xff252A34);
  static Color object = const Color(0xffFCFEFF);
  static Color other = const Color(0xffD9D1D1);
  static Color action = const Color(0xff5568FE);

  static void warning(
      {required msg, title = "Warning", confirmText = "Ok", void action}) {
    Get.defaultDialog(
      backgroundColor: foreground,
      title: "$title",
      middleText: "$msg",
      textConfirm: "$confirmText",
      titleStyle: TextStyle(color: object, fontSize: 25),
      middleTextStyle: TextStyle(color: object, fontSize: 15),
      onConfirm: () {
        if (confirmText != "Ok") {
          action;
        }
        Get.back();
      },
    );
  }
}
